#!/bin/bash

APPNAME=$1
PATH=$2
ICON=$3

/usr/bin/sed -i '' "s/CustomFinderSidebarIcons/$APPNAME/g" "CustomFinderSidebarIcons.xcodeproj/project.pbxproj"
/usr/bin/sed -i '' "s/CustomFinderSidebarIconSync/${APPNAME}Sync/g" "CustomFinderSidebarIcons.xcodeproj/project.pbxproj"
/usr/bin/sed -i '' "s/CustomFinderSidebarIcons/$APPNAME/g" "CustomFinderSidebarIcons.xcodeproj/project.xcworkspace/contents.xcworkspacedata"
/usr/bin/sed -i '' "s/CustomFinderSidebarIcons/$APPNAME/g" "CustomFinderSidebarIcons.xcodeproj/xcuserdata/robb.xcuserdatad/xcschemes/xcschememanagement.plist"
/usr/bin/sed -i '' "s/CustomFinderSidebarIconSync/${APPNAME}Sync/g" "CustomFinderSidebarIcons.xcodeproj/xcuserdata/robb.xcuserdatad/xcschemes/xcschememanagement.plist"
/usr/bin/sed -i '' "s/flame/$ICON/g" "CustomFinderSidebarIcons/info.plist"
/usr/bin/sed -i '' "s#PATH_GOES_HERE#$PATH#g" "CustomFinderSidebarIconSync/URLs"

/bin/mv CustomFinderSidebarIcons/CustomFinderSidebarIcons.entitlements CustomFinderSidebarIcons/$APPNAME.entitlements
/bin/mv CustomFinderSidebarIconSync/CustomFinderSidebarIconSync.entitlements CustomFinderSidebarIconSync/${APPNAME}Sync.entitlements
/bin/mv CustomFinderSidebarIcons.xcodeproj $APPNAME.xcodeproj
/bin/mv CustomFinderSidebarIcons $APPNAME
/bin/mv CustomFinderSidebarIconSync "${APPNAME}Sync"