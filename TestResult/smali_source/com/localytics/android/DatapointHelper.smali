.class final Lcom/localytics/android/DatapointHelper;
.super Ljava/lang/Object;
.source "DatapointHelper.java"


# static fields
.field private static final HARDWARE_TELEPHONY:[Ljava/lang/Object;

.field private static final HARDWARE_WIFI:[Ljava/lang/Object;

.field private static final STRING_CLASS_ARRAY:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 54
    new-array v0, v3, [Ljava/lang/Class;

    const-class v1, Ljava/lang/String;

    aput-object v1, v0, v2

    sput-object v0, Lcom/localytics/android/DatapointHelper;->STRING_CLASS_ARRAY:[Ljava/lang/Class;

    .line 60
    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "android.hardware.wifi"

    aput-object v1, v0, v2

    sput-object v0, Lcom/localytics/android/DatapointHelper;->HARDWARE_WIFI:[Ljava/lang/Object;

    .line 66
    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "android.hardware.telephony"

    aput-object v1, v0, v2

    sput-object v0, Lcom/localytics/android/DatapointHelper;->HARDWARE_TELEPHONY:[Ljava/lang/Object;

    return-void
.end method

.method public static getAdvertisingIdOrNull(Landroid/content/Context;)Ljava/lang/String;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 198
    const/4 v2, 0x0

    .line 203
    .local v2, "advertisingId":Ljava/lang/String;
    :try_start_1
    const-string v4, "com.google.android.gms.ads.identifier.AdvertisingIdClient"

    const-string v5, "getAdvertisingIdInfo"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p0, v7, v8

    invoke-static {v4, v5, v6, v7}, Lcom/localytics/android/ReflectionUtils;->tryInvokeStatic(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 205
    .local v1, "adInfo":Ljava/lang/Object;
    if-eqz v1, :cond_25

    .line 207
    const-string v4, "getId"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v1, v4, v5, v6}, Lcom/localytics/android/ReflectionUtils;->tryInvokeInstance(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_25} :catch_26

    .line 218
    .end local v1    # "adInfo":Ljava/lang/Object;
    :cond_25
    :goto_25
    return-object v2

    .line 210
    :catch_26
    move-exception v3

    .line 212
    .local v3, "e":Ljava/lang/Exception;
    sget-boolean v4, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v4, :cond_25

    .line 214
    const-string v4, "Localytics"

    const-string v5, "Localytics library can\'t get the advertising id"

    invoke-static {v4, v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_25
.end method

.method public static getAndroidIdHashOrNull(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    invoke-static {p0}, Lcom/localytics/android/DatapointHelper;->getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "androidId":Ljava/lang/String;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    invoke-static {v0}, Lcom/localytics/android/DatapointHelper;->getSha256_buggy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public static getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;
    .registers 13
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 140
    new-instance v4, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/localytics/device_id"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 141
    .local v4, "fp":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_60

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_60

    .line 145
    const/4 v6, 0x0

    .line 148
    .local v6, "reader":Ljava/io/BufferedReader;
    const/16 v8, 0x64

    :try_start_2f
    new-array v1, v8, [C

    .line 150
    .local v1, "buf":[C
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    const/16 v9, 0x80

    invoke-direct {v7, v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_3d
    .catch Ljava/io/FileNotFoundException; {:try_start_2f .. :try_end_3d} :catch_4f
    .catchall {:try_start_2f .. :try_end_3d} :catchall_7a

    .line 151
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .local v7, "reader":Ljava/io/BufferedReader;
    :try_start_3d
    invoke-virtual {v7, v1}, Ljava/io/BufferedReader;->read([C)I

    move-result v5

    .line 152
    .local v5, "numRead":I
    const/4 v8, 0x0

    invoke-static {v1, v8, v5}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "deviceId":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_49
    .catch Ljava/io/FileNotFoundException; {:try_start_3d .. :try_end_49} :catch_96
    .catchall {:try_start_3d .. :try_end_49} :catchall_93

    .line 165
    if-eqz v7, :cond_4e

    .line 167
    :try_start_4b
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_4e} :catch_90

    .line 186
    .end local v1    # "buf":[C
    .end local v2    # "deviceId":Ljava/lang/String;
    .end local v5    # "numRead":I
    .end local v7    # "reader":Ljava/io/BufferedReader;
    :cond_4e
    :goto_4e
    return-object v2

    .line 156
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    :catch_4f
    move-exception v3

    .line 158
    .local v3, "e":Ljava/io/FileNotFoundException;
    :goto_50
    :try_start_50
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_5b

    .line 160
    const-string v8, "Localytics"

    const-string v9, "Caught exception"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5b
    .catchall {:try_start_50 .. :try_end_5b} :catchall_7a

    .line 165
    :cond_5b
    if-eqz v6, :cond_60

    .line 167
    :try_start_5d
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_60} :catch_81

    .line 180
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    :cond_60
    :goto_60
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "android_id"

    invoke-static {v8, v9}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "androidId":Ljava/lang/String;
    if-eqz v0, :cond_78

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "9774d56d682e549c"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8e

    .line 183
    :cond_78
    const/4 v2, 0x0

    goto :goto_4e

    .line 165
    .end local v0    # "androidId":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    :catchall_7a
    move-exception v8

    :goto_7b
    if-eqz v6, :cond_80

    .line 167
    :try_start_7d
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    :cond_80
    throw v8
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7d .. :try_end_81} :catch_81

    .line 171
    :catch_81
    move-exception v3

    .line 173
    .local v3, "e":Ljava/io/IOException;
    :goto_82
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_60

    .line 175
    const-string v8, "Localytics"

    const-string v9, "Caught exception"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_60

    .end local v3    # "e":Ljava/io/IOException;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v0    # "androidId":Ljava/lang/String;
    :cond_8e
    move-object v2, v0

    .line 186
    goto :goto_4e

    .line 171
    .end local v0    # "androidId":Ljava/lang/String;
    .restart local v1    # "buf":[C
    .restart local v2    # "deviceId":Ljava/lang/String;
    .restart local v5    # "numRead":I
    .restart local v7    # "reader":Ljava/io/BufferedReader;
    :catch_90
    move-exception v3

    move-object v6, v7

    .end local v7    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    goto :goto_82

    .line 165
    .end local v2    # "deviceId":Ljava/lang/String;
    .end local v5    # "numRead":I
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v7    # "reader":Ljava/io/BufferedReader;
    :catchall_93
    move-exception v8

    move-object v6, v7

    .end local v7    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    goto :goto_7b

    .line 156
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v7    # "reader":Ljava/io/BufferedReader;
    :catch_96
    move-exception v3

    move-object v6, v7

    .end local v7    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    goto :goto_50
.end method

.method static getApiLevel()I
    .registers 6

    .prologue
    .line 88
    :try_start_0
    const-class v0, Landroid/os/Build$VERSION;

    .line 89
    .local v0, "buildClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "SDK"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 90
    .local v3, "sdkString":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_14

    move-result v4

    .line 112
    .end local v3    # "sdkString":Ljava/lang/String;
    :goto_13
    return v4

    .line 92
    :catch_14
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "Localytics"

    const-string v5, "Caught exception"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    :try_start_1c
    const-class v0, Landroid/os/Build$VERSION;

    .line 100
    const-string v4, "SDK_INT"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_28} :catch_2a

    move-result v4

    goto :goto_13

    .line 102
    :catch_2a
    move-exception v2

    .line 104
    .local v2, "ignore":Ljava/lang/Exception;
    sget-boolean v4, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v4, :cond_36

    .line 106
    const-string v4, "Localytics"

    const-string v5, "Caught exception"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    :cond_36
    const/4 v4, 0x3

    goto :goto_13
.end method

.method public static getAppVersion(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 431
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 435
    .local v1, "pm":Landroid/content/pm/PackageManager;
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v2, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 440
    .local v2, "versionName":Ljava/lang/String;
    if-nez v2, :cond_1e

    .line 442
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_1c

    .line 444
    const-string v3, "Localytics"

    const-string v4, "versionName was null--is a versionName attribute set in the Android Manifest?"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    :cond_1c
    const-string v2, "unknown"
    :try_end_1e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_1e} :catch_1f

    .line 450
    .end local v2    # "versionName":Ljava/lang/String;
    :cond_1e
    return-object v2

    .line 452
    :catch_1f
    move-exception v0

    .line 457
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static getFBAttribution(Landroid/content/Context;)Ljava/lang/String;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 388
    const/4 v9, 0x0

    .line 390
    .local v9, "facebookAttribution":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 391
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    const-string v3, "content://com.facebook.katana.provider.AttributionIdProvider"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 392
    .local v1, "uri":Landroid/net/Uri;
    const-string v6, "aid"

    .line 393
    .local v6, "columnName":Ljava/lang/String;
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "aid"

    aput-object v4, v2, v3

    .line 395
    .local v2, "projection":[Ljava/lang/String;
    const/4 v7, 0x0

    .line 398
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_19
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 399
    if-eqz v7, :cond_2f

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 401
    const-string v3, "aid"

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_2e} :catch_36
    .catchall {:try_start_19 .. :try_end_2e} :catchall_49

    move-result-object v9

    .line 413
    :cond_2f
    if-eqz v7, :cond_35

    .line 415
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 416
    const/4 v7, 0x0

    .line 420
    :cond_35
    :goto_35
    return-object v9

    .line 404
    :catch_36
    move-exception v8

    .line 406
    .local v8, "e":Ljava/lang/Exception;
    :try_start_37
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_42

    .line 408
    const-string v3, "Localytics"

    const-string v4, "Error reading FB attribution"

    invoke-static {v3, v4, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_42
    .catchall {:try_start_37 .. :try_end_42} :catchall_49

    .line 413
    :cond_42
    if-eqz v7, :cond_35

    .line 415
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 416
    const/4 v7, 0x0

    goto :goto_35

    .line 413
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_49
    move-exception v3

    if-eqz v7, :cond_50

    .line 415
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 416
    const/4 v7, 0x0

    :cond_50
    throw v3
.end method

.method public static getLocalyticsAppKeyOrNull(Landroid/content/Context;)Ljava/lang/String;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 463
    const/4 v1, 0x0

    .line 467
    .local v1, "appKey":Ljava/lang/String;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 468
    .local v2, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v5, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v6, "LOCALYTICS_APP_KEY"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 469
    .local v4, "metaData":Ljava/lang/Object;
    instance-of v5, v4, Ljava/lang/String;

    if-eqz v5, :cond_1f

    .line 471
    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v1, v0
    :try_end_1f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1f} :catch_20

    .line 482
    :cond_1f
    return-object v1

    .line 474
    .end local v2    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "metaData":Ljava/lang/Object;
    :catch_20
    move-exception v3

    .line 479
    .local v3, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public static getLocalyticsRollupKeyOrNull(Landroid/content/Context;)Ljava/lang/String;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 487
    const/4 v4, 0x0

    .line 491
    .local v4, "rollupKey":Ljava/lang/String;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 492
    .local v1, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v5, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v5, :cond_25

    .line 494
    iget-object v5, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v6, "LOCALYTICS_ROLLUP_KEY"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 495
    .local v3, "metaData":Ljava/lang/String;
    instance-of v5, v3, Ljava/lang/String;

    if-eqz v5, :cond_25

    .line 497
    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v4, v0
    :try_end_25
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_25} :catch_26

    .line 509
    .end local v3    # "metaData":Ljava/lang/String;
    :cond_25
    return-object v4

    .line 501
    .end local v1    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    :catch_26
    move-exception v2

    .line 506
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public static getManufacturer()Ljava/lang/String;
    .registers 6

    .prologue
    .line 361
    const-string v3, "unknown"

    .line 362
    .local v3, "mfg":Ljava/lang/String;
    sget v4, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    const/4 v5, 0x3

    if-le v4, v5, :cond_18

    .line 366
    :try_start_7
    const-class v1, Landroid/os/Build;

    .line 367
    .local v1, "buildClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "MANUFACTURER"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_18} :catch_19

    .line 377
    .end local v1    # "buildClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_18
    :goto_18
    return-object v3

    .line 369
    :catch_19
    move-exception v2

    .line 371
    .local v2, "ignore":Ljava/lang/Exception;
    sget-boolean v4, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v4, :cond_18

    .line 373
    const-string v4, "Localytics"

    const-string v5, "Caught exception"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_18
.end method

.method public static getNetworkType(Landroid/content/Context;Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "telephonyManager"    # Landroid/telephony/TelephonyManager;

    .prologue
    .line 322
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v3, "android.permission.ACCESS_WIFI_STATE"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_28

    .line 324
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 325
    .local v1, "wifiInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_33

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 327
    const-string v2, "wifi"

    .line 350
    .end local v1    # "wifiInfo":Landroid/net/NetworkInfo;
    :goto_27
    return-object v2

    .line 332
    :cond_28
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_33

    .line 334
    const-string v2, "Localytics"

    const-string v3, "Application does not have one more more of the following permissions: ACCESS_WIFI_STATE. Determining Wi-Fi connectivity is unavailable"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_33
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_33} :catch_4b

    .line 350
    :cond_33
    :goto_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "android_network_type_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_27

    .line 338
    :catch_4b
    move-exception v0

    .line 344
    .local v0, "e":Ljava/lang/SecurityException;
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_33

    .line 346
    const-string v2, "Localytics"

    const-string v3, "Application does not have the permission ACCESS_NETWORK_STATE. Determining Wi-Fi connectivity is unavailable"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_33
.end method

.method public static getSerialNumberHashOrNull()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 239
    const/4 v1, 0x0

    .line 240
    .local v1, "serialNumber":Ljava/lang/String;
    sget v3, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    const/16 v4, 0x9

    if-lt v3, v4, :cond_17

    .line 244
    :try_start_8
    const-class v3, Landroid/os/Build;

    const-string v4, "SERIAL"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "serialNumber":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_17} :catch_1a

    .line 255
    .restart local v1    # "serialNumber":Ljava/lang/String;
    :cond_17
    if-nez v1, :cond_21

    .line 260
    :goto_19
    return-object v2

    .line 246
    .end local v1    # "serialNumber":Ljava/lang/String;
    :catch_1a
    move-exception v0

    .line 251
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 260
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "serialNumber":Ljava/lang/String;
    :cond_21
    invoke-static {v1}, Lcom/localytics/android/DatapointHelper;->getSha256_buggy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_19
.end method

.method static getSha256_buggy(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 526
    if-nez p0, :cond_a

    .line 528
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "string cannot be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 534
    :cond_a
    :try_start_a
    const-string v4, "SHA-256"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 535
    .local v3, "md":Ljava/security/MessageDigest;
    const-string v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 536
    .local v0, "digest":[B
    new-instance v2, Ljava/math/BigInteger;

    const/4 v4, 0x1

    invoke-direct {v2, v4, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 537
    .local v2, "hashedNumber":Ljava/math/BigInteger;
    const/16 v4, 0x10

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;
    :try_end_25
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_a .. :try_end_25} :catch_27
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_25} :catch_2e

    move-result-object v4

    return-object v4

    .line 539
    .end local v0    # "digest":[B
    .end local v2    # "hashedNumber":Ljava/math/BigInteger;
    .end local v3    # "md":Ljava/security/MessageDigest;
    :catch_27
    move-exception v1

    .line 541
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 543
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2e
    move-exception v1

    .line 545
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static getTelephonyDeviceIdOrNull(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 275
    sget v3, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    const/4 v4, 0x7

    if-lt v3, v4, :cond_28

    .line 278
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string v4, "hasSystemFeature"

    sget-object v5, Lcom/localytics/android/DatapointHelper;->STRING_CLASS_ARRAY:[Ljava/lang/Class;

    sget-object v6, Lcom/localytics/android/DatapointHelper;->HARDWARE_TELEPHONY:[Ljava/lang/Object;

    invoke-static {v3, v4, v5, v6}, Lcom/localytics/android/ReflectionUtils;->tryInvokeInstance(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 279
    .local v0, "hasTelephony":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_28

    .line 281
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_26

    .line 283
    const-string v3, "Localytics"

    const-string v4, "Device does not have telephony; cannot read telephony id"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    :cond_26
    const/4 v1, 0x0

    .line 308
    .end local v0    # "hasTelephony":Ljava/lang/Boolean;
    :cond_27
    :goto_27
    return-object v1

    .line 294
    :cond_28
    const/4 v1, 0x0

    .line 295
    .local v1, "id":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string v4, "android.permission.READ_PHONE_STATE"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_46

    .line 297
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 298
    .local v2, "manager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    .line 299
    goto :goto_27

    .line 302
    .end local v2    # "manager":Landroid/telephony/TelephonyManager;
    :cond_46
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_27

    .line 304
    const-string v3, "Localytics"

    const-string v4, "Application does not have permission READ_PHONE_STATE; determining device id is not possible.  Please consider requesting READ_PHONE_STATE in the AndroidManifest"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_27
.end method
