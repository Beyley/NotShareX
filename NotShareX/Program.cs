using System.Diagnostics;
using TextCopy;

//Mount the samba share
Process.Start("sudo", "mount -t cifs -o rw,uid=1000,gid=1000,vers=3.0,credentials=/root/.smbcreds //192.168.0.201/root /run/media/smbmount").WaitForExit();

//Generate a random filename, 8 random text chars, and a png extension
string randomFileName = Path.GetRandomFileName().Replace(".", "") + ".png";

//Start a new spectacle instance that saves to the share
Process.Start("spectacle", $"-b -r -o {Path.Combine("/run/media/smbmount/home/beyley/image-subdomain/", randomFileName)}").WaitForExit();

ClipboardService.SetText("https://i.beyleyisnot.moe/" + randomFileName);