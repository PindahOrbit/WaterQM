using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreGeneratedDocument;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using WaterQM.Data;
using WaterQM.Models;

namespace WaterQM.Controllers
{
    [Authorize]
    public class SensorReadingsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IHubContext<SensorHub> _hubContext;
        private static SerialPort _serialPort;

        public SensorReadingsController(AppDbContext context, IHubContext<SensorHub> hubContext)
        {
            _context = context;
            _context = context;
            _hubContext = hubContext;

            // Open Serial Port if not already open
            if (_serialPort == null)
            {
                _serialPort = new SerialPort("COM4", 9600);
                _serialPort.DataReceived += SerialDataReceived;
                _serialPort.Open();
            }

            _hubContext = hubContext;
        }

        private async void SerialDataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            try
            {
                string data = _serialPort.ReadLine().Trim();
                if (float.TryParse(data, out float phValue))
                {
                    var reading = new SensorReading
                    {
                        ParameterId = 1,
                        ReadingTime = DateTime.Now,
                        ReadingValue = phValue,
                        SensorId = 1
                    };

                    // Save to Database
                    //_context.Add(reading);
                    //await _context.SaveChangesAsync();

                    // Send data to frontend via SignalR
                    await _hubContext.Clients.All.SendAsync("ReceiveSensorData", phValue, reading.ReadingTime);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }

        // GET: SensorReadings
        public IActionResult Index()
        {
            return View();
        }

        // GET: SensorReadings/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sensorReading = await _context.SensorReadings
                .Include(s => s.Parameter)
                .Include(s => s.Sensor)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (sensorReading == null)
            {
                return NotFound();
            }

            return View(sensorReading);
        }

        // GET: SensorReadings/Create
        public IActionResult Create()
        {
            ViewData["ParameterId"] = new SelectList(_context.WaterParameters, "Id", "Id");
            ViewData["SensorId"] = new SelectList(_context.Sensors, "Id", "Id");
            return View();
        }
        
        //public async Task<IActionResult> PlotAndSave()
        //{

        //    //code to save
        //    var reading = new SensorReading()
        //    {
        //        ParameterId = 1,
        //        ReadingTime = DateTime.Now,
        //        ReadingValue =, //value from iot ,
        //        SensorId = 1,


        //    };

        //    _context.Add(reading);
        //    await _context.SaveChangesAsync();
        //    ////code to plot
        //    ///



        //    return View();
        //}

        // POST: SensorReadings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,SensorId,ParameterId,ReadingValue,ReadingTime")] SensorReading sensorReading)
        {
            if (ModelState.IsValid)
            {
                _context.Add(sensorReading);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ParameterId"] = new SelectList(_context.WaterParameters, "Id", "Id", sensorReading.ParameterId);
            ViewData["SensorId"] = new SelectList(_context.Sensors, "Id", "Id", sensorReading.SensorId);
            return View(sensorReading);
        }

        // GET: SensorReadings/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sensorReading = await _context.SensorReadings.FindAsync(id);
            if (sensorReading == null)
            {
                return NotFound();
            }
            ViewData["ParameterId"] = new SelectList(_context.WaterParameters, "Id", "Id", sensorReading.ParameterId);
            ViewData["SensorId"] = new SelectList(_context.Sensors, "Id", "Id", sensorReading.SensorId);
            return View(sensorReading);
        }

        // POST: SensorReadings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,SensorId,ParameterId,ReadingValue,ReadingTime")] SensorReading sensorReading)
        {
            if (id != sensorReading.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(sensorReading);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SensorReadingExists(sensorReading.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ParameterId"] = new SelectList(_context.WaterParameters, "Id", "Id", sensorReading.ParameterId);
            ViewData["SensorId"] = new SelectList(_context.Sensors, "Id", "Id", sensorReading.SensorId);
            return View(sensorReading);
        }

        // GET: SensorReadings/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sensorReading = await _context.SensorReadings
                .Include(s => s.Parameter)
                .Include(s => s.Sensor)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (sensorReading == null)
            {
                return NotFound();
            }

            return View(sensorReading);
        }

        // POST: SensorReadings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var sensorReading = await _context.SensorReadings.FindAsync(id);
            if (sensorReading != null)
            {
                _context.SensorReadings.Remove(sensorReading);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SensorReadingExists(int id)
        {
            return _context.SensorReadings.Any(e => e.Id == id);
        }
    }
}
