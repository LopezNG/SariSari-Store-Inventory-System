# SariSari Inventory System

## Project overview
This solution is an ASP.NET Web Forms application for managing a sari-sari store inventory. It includes ASPX pages, a SQL Server LocalDB database file, and standard Web Forms code-behind.

## Required .NET version
- .NET Framework 4.8

## Open in Visual Studio Community
1. Open `SariSari-InventorySystem.sln` in Visual Studio Community 2022 (or later).
2. Ensure the "SariSari-InventorySystem" project is set as the startup project.

## Build
1. Restore NuGet packages.
2. Build the solution (`Build > Build Solution`).

## Run
1. Press **F5** or select **Debug > Start Debugging**.
2. Visual Studio should launch the web project using IIS Express at the configured URL.

## Troubleshooting: "not a valid Win32 application"
If Visual Studio reports it is trying to start `SariSari-InventorySystem.dll`, the project is being launched incorrectly. Fixes:
- Right-click the project and choose **Set as Startup Project**.
- Ensure the project is a **Web Application** (ASP.NET) and not configured as a Class Library.
- In project properties, verify **Start Action** is set to **Current Page** and **Server** is IIS Express.
- Clean/Rebuild the solution after restoring packages.
