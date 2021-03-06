///
module notsharex.config;

import std.stdio, std.path, std.file, std.exception, std.process, std.format,
std.algorithm, std.ascii, std.base64, std.conv, std.random, std.range, std.json, std.utf;
import core.stdc.stdlib : exit;
import painlessjson;

import notsharex.enums, notsharex.helpers;

/// A struct that defines the configuration
class Config {
    /// The path to the configuration file
    const static string configFilePath = "~/.config/notsharex/config.json";

    /// The main path that stores the image you take
    string mainImagePath    = "temp.png";
    /// The path used to store the static preview
    string staticPreviewPath = "static.png";

    /// Whether to show a static preview while selecting the area
    bool staticPreview = false;
    /// The connection type to use when interacting with the server
    ConnectionType connectionType = ConnectionType.smb;
    /// The directory to store all of the temporary files, etc. the image taken / the static preview
    string temporaryDirectory = "/tmp/";

    /// The server address
    string server = "smb://192.168.0.201";
    /// The server name
    string serverName = "192.168.0.201";
    /// The share to access
    string share = "root";
    /// The link for the final address
    string link = "https://i.beyleyisnot.moe";
    /// The path in the share to move to
    string pathToMoveTo = "home/beyley/image-subdomain";

    /// The length of the random filename
    int randomStringLength = 5;
    /// The message to say at the end
    string endMessage = "pen 15";

    /// The credentials file
    string credFile = "~/.config/notsharex/.creds";

    string uploadCredsName = "userhash";
    string userHash = "USER HASH";
    string uploadFileName = "fileToUpload";

    /// Saves the current config
    void save() {
        Config.writeConfig(this);
    }

    /// Reads the config
    static Config readConfig() {
        return fromJSON!Config(parseJSON(Helpers.readWholeFile(expandTilde(Config.configFilePath))));
    }

    /// Writes the current config to a file
    static void writeConfig(Config config) {                                                                                                                                                                      
        std.file.write(expandTilde(Config.configFilePath), config.toJSON.toString);                                                                                                                               
    }                                                                                                                                                                                                             
}
