#include "dvm_permissions.h"

Permission::Permission()
{
}


Permission::Permission( std::string name, std::string level, std::string info, std::string description )
{
	Permission_Name		= name;
	Permission_Level	= level;
	Permission_Info		= info;
	Permission_Description	= description;
}


Manifest_Permissions::Manifest_Permissions()
{
	permissions[0]		= Permission( "WRITE_SETTINGS", "dangerous", "modify global system settings", "Allows an application to modify the system's settings data. Malicious applications can corrupt your system's configuration." );
	permissions[1]		= Permission( "ADD_VOICEMAIL", "dangerous", "add voicemails into the system", "Allows an application to add voicemails into the system." );
	permissions[2]		= Permission( "USE_SIP", "dangerous", "make/receive Internet calls", "Allows an application to use the SIP service to make/receive Internet calls." );
	permissions[3]		= Permission( "BIND_WALLPAPER", "signatureOrSystem", "bind to wallpaper", "Allows the holder to bind to the top-level interface of wallpaper. Should never be needed for common applications." );
	permissions[4]		= Permission( "DUMP", "signatureOrSystem", "retrieve system internal status", "Allows application to retrieve internal status of the system. Malicious applications may retrieve a wide variety of private and secure information that they should never commonly need." );
	permissions[5]		= Permission( "WRITE_SOCIAL_STREAM", "dangerous", "write the user's social stream", "Allows an application to write (but not read) the user's social stream data." );
	permissions[6]		= Permission( "USE_CREDENTIALS", "dangerous", "use the authentication credentials of an account", "Allows an application to request authentication tokens." );
	permissions[7]		= Permission( "HARDWARE_TEST", "signature", "test hardware", "Allows the application to control various peripherals for the purpose of hardware testing." );
	permissions[8]		= Permission( "GET_ACCOUNTS", "normal", "discover known accounts", "Allows an application to access the list of accounts known by the phone." );
	permissions[9]		= Permission( "SEND_SMS", "dangerous", "send SMS messages", "Allows application to send SMS messages. Malicious applications may cost you money by sending messages without your confirmation." );
	permissions[10]		= Permission( "SET_ACTIVITY_WATCHER", "signature", "monitor and control all application launching", "Allows an application to monitor and control how the system launches activities. Malicious applications may compromise the system completely. This permission is needed only for development, never for common phone usage." );
	permissions[11]		= Permission( "MASTER_CLEAR", "signatureOrSystem", "reset system to factory defaults", "Allows an application to completely reset the system to its factory settings, erasing all data, configuration and installed applications." );
	permissions[12]		= Permission( "ACCESS_COARSE_LOCATION", "dangerous", "coarse (network-based) location", "Access coarse location sources, such as the mobile network database, to determine an approximate phone location, where available. Malicious applications can use this to determine approximately where you are." );
	permissions[13]		= Permission( "BIND_DEVICE_ADMIN", "signature", "interact with device admin", "Allows the holder to send intents to a device administrator. Should never be needed for common applications." );
	permissions[14]		= Permission( "CHANGE_WIFI_MULTICAST_STATE", "dangerous", "allow Wi-Fi Multicast reception", "Allows an application to receive packets not directly addressed to your device. This can be useful when discovering services offered nearby. It uses more power than the non-multicast mode." );
	permissions[15]		= Permission( "WRITE_SECURE_SETTINGS", "signatureOrSystem", "modify secure system settings", "Allows an application to modify the system's secure settings data. Not for use by common applications." );
	permissions[16]		= Permission( "READ_PROFILE", "dangerous", "read the user's personal profile data", "Allows an application to read the user's personal profile data." );
	permissions[17]		= Permission( "BROADCAST_WAP_PUSH", "signature", "send WAP-PUSH-received broadcast", "Allows an application to broadcast a notification that a WAP-PUSH message has been received. Malicious applications may use this to forge MMS message receipt or to replace the content of any web page silently with malicious variants." );
	permissions[18]		= Permission( "FACTORY_TEST", "signature", "run in factory test mode", "Run as a low-level manufacturer test, allowing complete access to the phone hardware. Only available when a phone is running in manufacturer test mode." );
	permissions[19]		= Permission( "DEVICE_POWER", "signature", "turn phone on or off", "Allows the application to turn the phone on or off." );
	permissions[20]		= Permission( "SET_ALWAYS_FINISH", "dangerous", "make all background applications close", "Allows an application to control whether activities are always finished as soon as they go to the background. Never needed for common applications." );
	permissions[21]		= Permission( "READ_CALENDAR", "dangerous", "read calendar events", "Allows an application to read all of the calendar events stored on your phone. Malicious applications can use this to send your calendar events to other people." );
	permissions[22]		= Permission( "ACCESS_SURFACE_FLINGER", "signature", "access SurfaceFlinger", "Allows application to use SurfaceFlinger low-level features." );
	permissions[23]		= Permission( "CHANGE_CONFIGURATION", "dangerous", "change your UI settings", "Allows an application to change the current configuration, such as the locale or overall font size." );
	permissions[24]		= Permission( "SYSTEM_ALERT_WINDOW", "dangerous", "display system-level alerts", "Allows an application to show system-alert windows. Malicious applications can take over the entire screen of the phone." );
	permissions[25]		= Permission( "WRITE_USER_DICTIONARY", "normal", "write to user-defined dictionary", "Allows an application to write new words into the user dictionary." );
	permissions[26]		= Permission( "ASEC_RENAME", "signature", "rename internal storage", "Allows the application to rename internal storage." );
	permissions[27]		= Permission( "READ_LOGS", "dangerous", "read sensitive log data", "Allows an application to read from the system's various log files. This allows it to discover general information about what you are doing with the phone, potentially including personal or private information." );
	permissions[28]		= Permission( "GET_PACKAGE_SIZE", "normal", "measure application storage space", "Allows an application to retrieve its code, data and cache sizes" );
	permissions[29]		= Permission( "ACCESS_LOCATION_EXTRA_COMMANDS", "normal", "access extra location provider commands", "Access extra location provider commands. Malicious applications could use this to interfere with the operation of the GPS or other location sources." );
	permissions[30]		= Permission( "PERFORM_CDMA_PROVISIONING", "signatureOrSystem", "directly start CDMA phone setup", "Allows the application to start CDMA provisioning. Malicious applications may start CDMA provisioning unnecessarily" );
	permissions[31]		= Permission( "WRITE_APN_SETTINGS", "dangerous", "write Access Point Name settings", "Allows an application to modify the APN settings, such as Proxy and Port of any APN." );
	permissions[32]		= Permission( "CONTROL_LOCATION_UPDATES", "signatureOrSystem", "control location update notifications", "Allows enabling/disabling location update notifications from the radio. Not for use by common applications." );
	permissions[33]		= Permission( "RECEIVE_BOOT_COMPLETED", "normal", "automatically start at boot", "Allows an application to start itself as soon as the system has finished booting. This can make it take longer to start the phone and allow the application to slow down the overall phone by always running." );
	permissions[34]		= Permission( "SET_ALARM", "normal", "set alarm in alarm clock", "Allows the application to set an alarm in an installed alarm clock application. Some alarm clock applications may not implement this feature." );
	permissions[35]		= Permission( "WRITE_CONTACTS", "dangerous", "write contact data", "Allows an application to modify the contact (address) data stored on your phone. Malicious applications can use this to erase or modify your contact data." );
	permissions[36]		= Permission( "CLEAR_APP_CACHE", "dangerous", "delete all application cache data", "Allows an application to free phone storage by deleting files in application cache directory. Access is usually very restricted to system process." );
	permissions[37]		= Permission( "PROCESS_OUTGOING_CALLS", "dangerous", "intercept outgoing calls", "Allows application to process outgoing calls and change the number to be dialled. Malicious applications may monitor, redirect or prevent outgoing calls." );
	permissions[38]		= Permission( "EXPAND_STATUS_BAR", "normal", "expand/collapse status bar", "Allows application to expand or collapse the status bar." );
	permissions[39]		= Permission( "ACCESS_CACHE_FILESYSTEM", "signatureOrSystem", "access the cache file system", "Allows an application to read and write the cache file system." );
	permissions[40]		= Permission( "MODIFY_PHONE_STATE", "signatureOrSystem", "modify phone status", "Allows the application to control the phone features of the device. An application with this permission can switch networks, turn the phone radio on and off and the like, without ever notifying you." );
	permissions[41]		= Permission( "WRITE_GSERVICES", "signatureOrSystem", "modify the Google services map", "Allows an application to modify the Google services map. Not for use by common applications." );
	permissions[42]		= Permission( "SIGNAL_PERSISTENT_PROCESSES", "dangerous", "send Linux signals to applications", "Allows application to request that the supplied signal be sent to all persistent processes." );
	permissions[43]		= Permission( "RECEIVE_MMS", "dangerous", "receive MMS", "Allows application to receive and process MMS messages. Malicious applications may monitor your messages or delete them without showing them to you." );
	permissions[44]		= Permission( "MOUNT_FORMAT_FILESYSTEMS", "dangerous", "format external storage", "Allows the application to format removable storage." );
	permissions[45]		= Permission( "READ_INPUT_STATE", "signature", "record what you type and actions that you take", "Allows applications to watch the keys that you press even when interacting with another application (such as entering a password). Should never be needed for common applications." );
	permissions[46]		= Permission( "BATTERY_STATS", "normal", "modify battery statistics", "Allows the modification of collected battery statistics. Not for use by common applications." );
	permissions[47]		= Permission( "READ_SYNC_STATS", "normal", "read sync statistics", "Allows an application to read the sync stats; e.g. the history of syncs that have occurred." );
	permissions[48]		= Permission( "SET_WALLPAPER_HINTS", "normal", "set wallpaper size hints", "Allows the application to set the system wallpaper size hints." );
	permissions[49]		= Permission( "COPY_PROTECTED_DATA", "signature", "Allows to invoke default container service to copy content. Not for use by common applications.", "Allows to invoke default container service to copy content. Not for use by common applications." );
	permissions[50]		= Permission( "SET_TIME", "signatureOrSystem", "set time", "Allows an application to change the phone's clock time." );
	permissions[51]		= Permission( "AUTHENTICATE_ACCOUNTS", "dangerous", "act as an account authenticator", "Allows an application to use the account authenticator capabilities of the Account Manager, including creating accounts as well as obtaining and setting their passwords." );
	permissions[52]		= Permission( "RECEIVE_WAP_PUSH", "dangerous", "receive WAP", "Allows application to receive and process WAP messages. Malicious applications may monitor your messages or delete them without showing them to you." );
	permissions[53]		= Permission( "CHANGE_BACKGROUND_DATA_SETTING", "signature", "change background data usage setting", "Allows an application to change the background data usage setting." );
	permissions[54]		= Permission( "RESTART_PACKAGES", "normal", "kill background processes", "Allows an application to kill background processes of other applications, even if memory is not low." );
	permissions[55]		= Permission( "MOUNT_UNMOUNT_FILESYSTEMS", "dangerous", "mount and unmount file systems", "Allows the application to mount and unmount file systems for removable storage." );
	permissions[56]		= Permission( "GLOBAL_SEARCH_CONTROL", "signature", "", "" );
	permissions[57]		= Permission( "SUBSCRIBED_FEEDS_WRITE", "dangerous", "write subscribed feeds", "Allows an application to modify your currently synced feeds. This could allow a malicious application to change your synced feeds." );
	permissions[58]		= Permission( "STATUS_BAR", "signatureOrSystem", "disable or modify status bar", "Allows application to disable the status bar or add and remove system icons." );
	permissions[59]		= Permission( "MOVE_PACKAGE", "signatureOrSystem", "Move application resources", "Allows an application to move application resources from internal to external media and vice versa." );
	permissions[60]		= Permission( "MANAGE_APP_TOKENS", "signature", "manage application tokens", "Allows applications to create and manage their own tokens, bypassing their common Z-ordering. Should never be needed for common applications." );
	permissions[61]		= Permission( "ACCESS_WIFI_STATE", "normal", "view Wi-Fi status", "Allows an application to view the information about the status of Wi-Fi." );
	permissions[62]		= Permission( "SET_WALLPAPER_COMPONENT", "signatureOrSystem", "", "" );
	permissions[63]		= Permission( "INTERNET", "dangerous", "full Internet access", "Allows an application to create network sockets." );
	permissions[64]		= Permission( "DELETE_PACKAGES", "signatureOrSystem", "delete applications", "Allows an application to delete Android packages. Malicious applications can use this to delete important applications." );
	permissions[65]		= Permission( "READ_HISTORY_BOOKMARKS", "dangerous", "read Browser's history and bookmarks", "Allows the application to read all the URLs that the browser has visited and all of the browser's bookmarks." );
	permissions[66]		= Permission( "CHANGE_COMPONENT_ENABLED_STATE", "signatureOrSystem", "enable or disable application components", "Allows an application to change whether or not a component of another application is enabled. Malicious applications can use this to disable important phone capabilities. It is important to be careful with permission, as it is possible to bring application components into an unusable, inconsistent or unstable state." );
	permissions[67]		= Permission( "ASEC_DESTROY", "signature", "destroy internal storage", "Allows the application to destroy internal storage." );
	permissions[68]		= Permission( "ASEC_ACCESS", "signature", "get information on internal storage", "Allows the application to get information on internal storage." );
	permissions[69]		= Permission( "SUBSCRIBED_FEEDS_READ", "normal", "read subscribed feeds", "Allows an application to receive details about the currently synced feeds." );
	permissions[70]		= Permission( "ACCESS_NETWORK_STATE", "normal", "view network status", "Allows an application to view the status of all networks." );
	permissions[71]		= Permission( "RECORD_AUDIO", "dangerous", "record audio", "Allows application to access the audio record path." );
	permissions[72]		= Permission( "READ_EXTERNAL_STORAGE", "dangerous", "read SD card contents", "Allows an application to read from SD Card." );
	permissions[73]		= Permission( "ACCESS_MOCK_LOCATION", "dangerous", "mock location sources for testing", "Create mock location sources for testing. Malicious applications can use this to override the location and/or status returned by real-location sources such as GPS or Network providers." );
	permissions[74]		= Permission( "GLOBAL_SEARCH", "signatureOrSystem", "", "" );
	permissions[75]		= Permission( "WRITE_PROFILE", "dangerous", "write the user's personal profile data", "Allows an application to write (but not read) the user's personal profile data." );
	permissions[76]		= Permission( "READ_SOCIAL_STREAM", "dangerous", "read from the user's social stream", "Allows an application to read from the user's social stream." );
	permissions[77]		= Permission( "VIBRATE", "normal", "control vibrator", "Allows the application to control the vibrator." );
	permissions[78]		= Permission( "DIAGNOSTIC", "signature", "read/write to resources owned by diag", "Allows an application to read and write to any resource owned by the diag group; for example, files in /dev. This could potentially affect system stability and security. This should ONLY be used for hardware-specific diagnostics by the manufacturer or operator." );
	permissions[79]		= Permission( "ASEC_CREATE", "signature", "create internal storage", "Allows the application to create internal storage." );
	permissions[80]		= Permission( "READ_SYNC_SETTINGS", "normal", "read sync settings", "Allows an application to read the sync settings, such as whether sync is enabled for Contacts." );
	permissions[81]		= Permission( "SEND_SMS_NO_CONFIRMATION", "dangerous", "send SMS messages", "send SMS messages via the Messaging app with no user input or confirmation" );
	permissions[82]		= Permission( "ACCESS_CHECKIN_PROPERTIES", "signatureOrSystem", "access check-in properties", "Allows read/write access to properties uploaded by the check-in service. Not for use by common applications." );
	permissions[83]		= Permission( "SHUTDOWN", "signature", "partial shutdown", "Puts the activity manager into a shut-down state. Does not perform a complete shut down." );
	permissions[84]		= Permission( "ACCESS_USB", "signatureOrSystem", "access USB devices", "Allows the application to access USB devices." );
	permissions[85]		= Permission( "UPDATE_DEVICE_STATS", "signatureOrSystem", "modify battery statistics", "Allows the modification of collected battery statistics. Not for use by common applications." );
	permissions[86]		= Permission( "INSTALL_PACKAGES", "signatureOrSystem", "directly install applications", "Allows an application to install new or updated Android packages. Malicious applications can use this to add new applications with arbitrarily powerful permissions." );
	permissions[87]		= Permission( "SET_ORIENTATION", "signature", "change screen orientation", "Allows an application to change the rotation of the screen at any time. Should never be needed for common applications." );
	permissions[88]		= Permission( "STATUS_BAR_SERVICE", "signature", "status bar", "Allows the application to be the status bar." );
	permissions[89]		= Permission( "BIND_INPUT_METHOD", "signature", "bind to an input method", "Allows the holder to bind to the top-level interface of an input method. Should never be needed for common applications." );
	permissions[90]		= Permission( "FLASHLIGHT", "normal", "control flashlight", "Allows the application to control the flashlight." );
	permissions[91]		= Permission( "STOP_APP_SWITCHES", "signature", "prevent app switches", "Prevents the user from switching to another application." );
	permissions[92]		= Permission( "CHANGE_WIFI_STATE", "dangerous", "change Wi-Fi status", "Allows an application to connect to and disconnect from Wi-Fi access points and to make changes to configured Wi-Fi networks." );
	permissions[93]		= Permission( "BROADCAST_STICKY", "normal", "send sticky broadcast", "Allows an application to send sticky broadcasts, which remain after the broadcast ends. Malicious applications can make the phone slow or unstable by causing it to use too much memory." );
	permissions[94]		= Permission( "WRITE_SMS", "dangerous", "edit SMS or MMS", "Allows application to write to SMS messages stored on your phone or SIM card. Malicious applications may delete your messages." );
	permissions[95]		= Permission( "FORCE_STOP_PACKAGES", "signature", "force-stop other applications", "Allows an application to stop other applications forcibly." );
	permissions[96]		= Permission( "KILL_BACKGROUND_PROCESSES", "normal", "kill background processes", "Allows an application to kill background processes of other applications, even if memory is not low." );
	permissions[97]		= Permission( "SET_PROCESS_LIMIT", "dangerous", "limit number of running processes", "Allows an application to control the maximum number of processes that will run. Never needed for common applications." );
	permissions[98]		= Permission( "SET_TIME_ZONE", "dangerous", "set time zone", "Allows an application to change the phone's time zone." );
	permissions[99]		= Permission( "BLUETOOTH_ADMIN", "dangerous", "bluetooth administration", "Allows an application to configure the local Bluetooth phone and to discover and pair with remote devices." );
	permissions[100]	= Permission( "INJECT_EVENTS", "signature", "press keys and control buttons", "Allows an application to deliver its own input events (key presses, etc.) to other applications. Malicious applications can use this to take over the phone." );
	permissions[101]	= Permission( "PERSISTENT_ACTIVITY", "dangerous", "make application always run", "Allows an application to make parts of itself persistent, so that the system can't use it for other applications." );
	permissions[102]	= Permission( "CAMERA", "dangerous", "take pictures and videos", "Allows application to take pictures and videos with the camera. This allows the application to collect images that the camera is seeing at any time." );
	permissions[103]	= Permission( "READ_FRAME_BUFFER", "signature", "read frame buffer", "Allows application to read the content of the frame buffer." );
	permissions[104]	= Permission( "SET_WALLPAPER", "normal", "set wallpaper", "Allows the application to set the system wallpaper." );
	permissions[105]	= Permission( "WAKE_LOCK", "dangerous", "prevent phone from sleeping", "Allows an application to prevent the phone from going to sleep." );
	permissions[106]	= Permission( "MANAGE_ACCOUNTS", "dangerous", "manage the accounts list", "Allows an application to perform operations like adding and removing accounts and deleting their password." );
	permissions[107]	= Permission( "WRITE_CALENDAR", "dangerous", "add or modify calendar events and send emails to guests", "Allows an application to add or change the events on your calendar, which may send emails to guests. Malicious applications can use this to erase or modify your calendar events or to send emails to guests." );
	permissions[108]	= Permission( "WRITE_HISTORY_BOOKMARKS", "dangerous", "write Browser's history and bookmarks", "Allows an application to modify the browser's history or bookmarks stored on your phone. Malicious applications can use this to erase or modify your browser's data." );
	permissions[109]	= Permission( "INTERNAL_SYSTEM_WINDOW", "signature", "display unauthorised windows", "Allows the creation of windows that are intended to be used by the internal system user interface. Not for use by common applications." );
	permissions[110]	= Permission( "FORCE_BACK", "signature", "force application to close", "Allows an application to force any activity that is in the foreground to close and go back. Should never be needed for common applications." );
	permissions[111]	= Permission( "ASEC_MOUNT_UNMOUNT", "signature", "mount/unmount internal storage", "Allows the application to mount/unmount internal storage." );
	permissions[112]	= Permission( "SET_PREFERRED_APPLICATIONS", "signature", "set preferred applications", "Allows an application to modify your preferred applications. This can allow malicious applications to silently change the applications that are run, spoofing your existing applications to collect private data from you." );
	permissions[113]	= Permission( "NFC", "dangerous", "control Near-Field Communication", "Allows an application to communicate with Near-Field Communication (NFC) tags, cards and readers." );
	permissions[114]	= Permission( "CHANGE_NETWORK_STATE", "dangerous", "change network connectivity", "Allows an application to change the state of network connectivity." );
	permissions[115]	= Permission( "CALL_PHONE", "dangerous", "directly call phone numbers", "Allows the application to call phone numbers without your intervention. Malicious applications may cause unexpected calls on your phone bill. Note that this does not allow the application to call emergency numbers." );
	permissions[116]	= Permission( "WRITE_SYNC_SETTINGS", "dangerous", "write sync settings", "Allows an application to modify the sync settings, such as whether sync is enabled for Contacts." );
	permissions[117]	= Permission( "ACCOUNT_MANAGER", "signature", "act as the Account Manager Service", "Allows an application to make calls to Account Authenticators" );
	permissions[118]	= Permission( "SET_ANIMATION_SCALE", "dangerous", "modify global animation speed", "Allows an application to change the global animation speed (faster or slower animations) at any time." );
	permissions[119]	= Permission( "ACCESS_FINE_LOCATION", "dangerous", "fine (GPS) location", "Access fine location sources, such as the Global Positioning System on the phone, where available. Malicious applications can use this to determine where you are and may consume additional battery power." );
	permissions[120]	= Permission( "BRICK", "signature", "permanently disable phone", "Allows the application to disable the entire phone permanently. This is very dangerous." );
	permissions[121]	= Permission( "CALL_PRIVILEGED", "signatureOrSystem", "directly call any phone numbers", "Allows the application to call any phone number, including emergency numbers, without your intervention. Malicious applications may place unnecessary and illegal calls to emergency services." );
	permissions[122]	= Permission( "READ_SMS", "dangerous", "read SMS or MMS", "Allows application to read SMS messages stored on your phone or SIM card. Malicious applications may read your confidential messages." );
	permissions[123]	= Permission( "PACKAGE_USAGE_STATS", "signature", "update component usage statistics", "Allows the modification of collected component usage statistics. Not for use by common applications." );
	permissions[124]	= Permission( "RECEIVE_SMS", "dangerous", "receive SMS", "Allows application to receive and process SMS messages. Malicious applications may monitor your messages or delete them without showing them to you." );
	permissions[125]	= Permission( "CLEAR_APP_USER_DATA", "signature", "delete other applications' data", "Allows an application to clear user data." );
	permissions[126]	= Permission( "GET_TASKS", "dangerous", "retrieve running applications", "Allows application to retrieve information about currently and recently running tasks. May allow malicious applications to discover private information about other applications." );
	permissions[127]	= Permission( "DELETE_CACHE_FILES", "signatureOrSystem", "delete other applications' caches", "Allows an application to delete cache files." );
	permissions[128]	= Permission( "WRITE_EXTERNAL_STORAGE", "dangerous", "read/modify/delete SD card contents", "Allows an application to write to the SD card." );
	permissions[129]	= Permission( "DISABLE_KEYGUARD", "dangerous", "disable key lock", "Allows an application to disable the key lock and any associated password security. A legitimate example of this is the phone disabling the key lock when receiving an incoming phone call, then re-enabling the key lock when the call is finished." );
	permissions[130]	= Permission( "BROADCAST_PACKAGE_REMOVED", "signature", "send package removed broadcast", "Allows an application to broadcast a notification that an application package has been removed. Malicious applications may use this to kill any other application running." );
	permissions[131]	= Permission( "REBOOT", "signatureOrSystem", "force phone reboot", "Allows the application to force the phone to reboot." );
	permissions[132]	= Permission( "BLUETOOTH", "dangerous", "create Bluetooth connections", "Allows an application to view configuration of the local Bluetooth phone and to make and accept connections with paired devices." );
	permissions[133]	= Permission( "SET_DEBUG_APP", "dangerous", "enable application debugging", "Allows an application to turn on debugging for another application. Malicious applications can use this to kill other applications." );
	permissions[134]	= Permission( "INSTALL_LOCATION_PROVIDER", "signatureOrSystem", "permission to install a location provider", "Create mock location sources for testing. Malicious applications can use this to override the location and/or status returned by real-location sources such as GPS or Network providers, or monitor and report your location to an external source." );
	permissions[135]	= Permission( "C2D_MESSAGE", "signature", "Allows cloud to device messaging", "Allows the application to receive push notifications." );
	permissions[136]	= Permission( "REORDER_TASKS", "dangerous", "reorder applications running", "Allows an application to move tasks to the foreground and background. Malicious applications can force themselves to the front without your control." );
	permissions[137]	= Permission( "READ_CONTACTS", "dangerous", "read contact data", "Allows an application to read all of the contact (address) data stored on your phone. Malicious applications can use this to send your data to other people." );
	permissions[138]	= Permission( "MODIFY_AUDIO_SETTINGS", "dangerous", "change your audio settings", "Allows application to modify global audio settings, such as volume and routing." );
	permissions[139]	= Permission( "READ_PHONE_STATE", "dangerous", "read phone state and identity", "Allows the application to access the phone features of the device. An application with this permission can determine the phone number and serial number of this phone, whether a call is active, the number that call is connected to and so on." );
	permissions[140]	= Permission( "BACKUP", "signatureOrSystem", "control system back up and restore", "Allows the application to control the system's back-up and restore mechanism. Not for use by common applications." );
	permissions[141]	= Permission( "READ_USER_DICTIONARY", "dangerous", "read user-defined dictionary", "Allows an application to read any private words, names and phrases that the user may have stored in the user dictionary." );
	permissions[142]	= Permission( "BROADCAST_SMS", "signature", "send SMS-received broadcast", "Allows an application to broadcast a notification that an SMS message has been received. Malicious applications may use this to forge incoming SMS messages." );
	permissions[143]	= Permission( "BIND_APPWIDGET", "signatureOrSystem", "choose widgets", "Allows the application to tell the system which widgets can be used by which application. With this permission, applications can give access to personal data to other applications. Not for use by common applications." );
}


Permission* Manifest_Permissions::search( std::string name )
{
	Permission * search_p = NULL;
	for ( int i = 0; i < MANI_PERMISSIONS_SUM; i++ )
	{
		if ( permissions[i].Permission_Name == name )
		{
			;
			search_p = &permissions[i];
			return(search_p);
		}
	}
	return(search_p);
}


Manifest_Permission_Group::Manifest_Permission_Group()
{
	permissions[0]	= Permission( "NETWORK", "", "", "Used for permissions that provide access to networking services." );
	permissions[1]	= Permission( "DEVELOPMENT_TOOLS", "", "", "Group of permissions that are related to development features." );
	permissions[2]	= Permission( "STORAGE", "", "", "Group of permissions that are related to SD card access." );
	permissions[3]	= Permission( "PERSONAL_INFO", "", "", "Used for permissions that provide access to the user's private data, such as contacts, calendar events, e-mail messages, etc." );
	permissions[4]	= Permission( "ACCOUNTS", "", "", "Permissions for direct access to the accounts managed by the Account Manager." );
	permissions[5]	= Permission( "SYSTEM_TOOLS", "", "", "Group of permissions that are related to system APIs." );
	permissions[6]	= Permission( "COST_MONEY", "", "", "Used for permissions that can be used to make the user spend money without their direct involvement." );
	permissions[7]	= Permission( "PHONE_CALLS", "", "", "Used for permissions that are associated with accessing and modifyign telephony state: intercepting outgoing calls, reading and modifying the phone state." );
	permissions[8]	= Permission( "MESSAGES", "", "", "Used for permissions that allow an application to send messages on behalf of the user or intercept messages being received by the user." );
	permissions[9]	= Permission( "LOCATION", "", "", "Used for permissions that allow access to the user's current location." );
	permissions[10] = Permission( "HARDWARE_CONTROLS", "", "", "Used for permissions that provide direct access to the hardware on the device." );
}


Permission* Manifest_Permission_Group::search( std::string name )
{
	Permission * search_p = NULL;
	for ( int i = 0; i < MANI_GROUP_PERMISSIONS_SUM; i++ )
	{
		if ( permissions[i].Permission_Name == name )
		{
			search_p = &permissions[i];
			return(search_p);
		}
	}
	return(search_p);
}