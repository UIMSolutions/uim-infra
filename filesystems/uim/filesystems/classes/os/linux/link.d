/****************************************************************************************************************
* Copyright: © 2018-2025 Ozan Nurettin Süel (aka UIManufaktur)                                                  *
* License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.         *
* Authors: Ozan Nurettin Süel (aka UIManufaktur)                                                                *
*****************************************************************************************************************/
module uim.filesystems.classes.os.linux.link;

mixin(Version!"test_uim_filesystems");

import uim.filesystems;
@safe:

class DLinuxLink : DLink {
  mixin(LinkThis!("Linux"));
}

mixin(LinkCalls!("Linux"));

version (testUimFilesystems) {
  unittest {
    version (testUimFilesystems) {
      debug writeln(StyledString("\nStart tests in " ~ __MODULE__)
          .setBackground(AnsiColor.yellow).setForeground(AnsiColor.black));
    }

    auto myFS = LinuxFilesystem("TestFs");
    myFS.rootPath("for_testing");

    if (!myFS.existsFolder("LinuxLink")) {
      myFS.createFolder("LinuxLink");
    }
    if (!myFS.existsFolder(["LinuxLink"], "links")) {
      myFS.createFolder(["LinuxLink"], "links");
    }
    if (!myFS.existsFolder(["LinuxLink"], "link")) {
      myFS.createFolder(["LinuxLink"], "link");
    }

    if (!myFS.existsFolder("LinuxLink/links/creatingLinks")) {
      myFS.createFolder("LinuxLink/links/creatingLinks");
    }

    if (!myFS.existsFolder("LinuxLink/links/readLinks")) {
      myFS.createFolder("LinuxLink/links/readLinks");
    }

    if (!myFS.existsFolder("LinuxLink/links/updateLinks")) {
      myFS.createFolder("LinuxLink/links/updateLinks");
    }

    if (!myFS.existsFolder("LinuxLink/links/removeLinks")) {
      myFS.createFolder("LinuxLink/links/removeLinks");
    }

    /* workFolder = (myFolder.existsFolder("creatingLinks") ? myFolder.folder("creatingLinks") : myFolder.createFolder("creatingLinks"));
  testLink_CreateLink(__MODULE__, workFolder, "creatingLinks", ["creatingLinks"]);
  workFolder = null;

  workFolder = (myFolder.existsFolder("readLinks") ? myFolder.folder("readLinks") : myFolder.createFolder("readLinks"));
  testLink_ReadLink(__MODULE__, workFolder, "readLinks", ["readLinks"]);
  workFolder = null;

  workFolder = (myFolder.existsFolder("updateLinks") ? myFolder.folder("updateLinks") : myFolder.createFolder("updateLinks"));
  testLink_UpdateLink(__MODULE__, workFolder, "updateLinks", ["updateLinks"]);
  workFolder = null;

  workFolder = (myFolder.existsFolder("removeLinks") ? myFolder.folder("removeLinks") : myFolder.createFolder("removeLinks"));
  testLink_RemoveLink(__MODULE__, workFolder, "removeLinks", ["removeLinks"]); 
  workFolder = null; */

    version (testUimFilesystems) {
      debug writeln(StyledString("End tests in " ~ __MODULE__)
          .setBackground(AnsiColor.white).setForeground(AnsiColor.black));
    }
  }
}
