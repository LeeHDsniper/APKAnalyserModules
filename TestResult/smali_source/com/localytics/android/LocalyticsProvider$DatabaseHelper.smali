.class final Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "LocalyticsProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/LocalyticsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DatabaseHelper"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 642
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 644
    iput-object p1, p0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    .line 645
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 659
    if-nez p1, :cond_f

    .line 661
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "db cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 665
    :cond_f
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT UNIQUE NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL CHECK(%s IN (%s, %s)));"

    const/16 v2, 0xa

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "api_keys"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "api_key"

    aput-object v3, v2, v7

    const-string v3, "uuid"

    aput-object v3, v2, v8

    const-string v3, "created_time"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "created_time"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "opt_out"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "opt_out"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "0"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "1"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 668
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT UNIQUE NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s INTEGER NOT NULL CHECK (%s >= 0));"

    const/16 v2, 0x20

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "sessions"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "api_key_ref"

    aput-object v3, v2, v7

    const-string v3, "api_keys"

    aput-object v3, v2, v8

    const-string v3, "_id"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "uuid"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "session_start_wall_time"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "session_start_wall_time"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "localytics_library_version"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "iu"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "app_version"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "android_version"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "android_sdk"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "device_model"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "device_manufacturer"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "device_android_id_hash"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "device_telephony_id"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "device_telephony_id_hash"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "device_serial_number_hash"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "device_wifi_mac_hash"

    aput-object v4, v2, v3

    const/16 v3, 0x14

    const-string v4, "locale_language"

    aput-object v4, v2, v3

    const/16 v3, 0x15

    const-string v4, "locale_country"

    aput-object v4, v2, v3

    const/16 v3, 0x16

    const-string v4, "network_carrier"

    aput-object v4, v2, v3

    const/16 v3, 0x17

    const-string v4, "network_country"

    aput-object v4, v2, v3

    const/16 v3, 0x18

    const-string v4, "network_type"

    aput-object v4, v2, v3

    const/16 v3, 0x19

    const-string v4, "device_country"

    aput-object v4, v2, v3

    const/16 v3, 0x1a

    const-string v4, "latitude"

    aput-object v4, v2, v3

    const/16 v3, 0x1b

    const-string v4, "longitude"

    aput-object v4, v2, v3

    const/16 v3, 0x1c

    const-string v4, "device_android_id"

    aput-object v4, v2, v3

    const/16 v3, 0x1d

    const-string v4, "device_advertising_id"

    aput-object v4, v2, v3

    const/16 v3, 0x1e

    const-string v4, "elapsed"

    aput-object v4, v2, v3

    const/16 v3, 0x1f

    const-string v4, "elapsed"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 671
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL CHECK (%s >= 0), %s INTEGER NOT NULL DEFAULT 0, %s REAL, %s REAL, %s TEXT, %s TEXT, %s TEXT);"

    const/16 v2, 0x11

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "events"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "session_key_ref"

    aput-object v3, v2, v7

    const-string v3, "sessions"

    aput-object v3, v2, v8

    const-string v3, "_id"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "uuid"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "event_name"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "real_time"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "real_time"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "wall_time"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "wall_time"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "clv_increase"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "event_lat"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "event_lng"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "customer_id"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "user_type"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "ids"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 678
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT NOT NULL CHECK(%s IN (%s, %s)), %s TEXT NOT NULL, %s INTEGER);"

    const/16 v2, 0xb

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "event_history"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "session_key_ref"

    aput-object v3, v2, v7

    const-string v3, "sessions"

    aput-object v3, v2, v8

    const-string v3, "_id"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "type"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "type"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/16 v3, 0x8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "name"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "processed_in_blob"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 682
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL);"

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "attributes"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "events_key_ref"

    aput-object v3, v2, v7

    const-string v3, "events"

    aput-object v3, v2, v8

    const-string v3, "_id"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "attribute_key"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "attribute_value"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 685
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL);"

    new-array v2, v8, [Ljava/lang/Object;

    const-string v3, "upload_blobs"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "uuid"

    aput-object v3, v2, v7

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 688
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER REFERENCES %s(%s) NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "upload_blob_events"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "upload_blobs_key_ref"

    aput-object v3, v2, v7

    const-string v3, "upload_blobs"

    aput-object v3, v2, v8

    const-string v3, "_id"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "events_key_ref"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "events"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "_id"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 691
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s TEXT, %s INTEGER, %s INTEGER, %s INTEGER);"

    const/16 v2, 0xe

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "info"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "fb_attribution"

    aput-object v3, v2, v7

    const-string v3, "play_attribution"

    aput-object v3, v2, v8

    const-string v3, "sender_id"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "registration_id"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "registration_version"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "first_android_id"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "first_telephony_id"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "first_advertising_id"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "package_name"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "first_run"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "push_disabled"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "last_session_open_time"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 692
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 693
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "fb_attribution"

    iget-object v2, p0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getFBAttribution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    const-string v1, "first_run"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 695
    const-string v1, "first_android_id"

    iget-object v2, p0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    const-string v1, "first_telephony_id"

    iget-object v2, p0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getTelephonyDeviceIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    const-string v1, "first_advertising_id"

    iget-object v2, p0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getAdvertisingIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    const-string v1, "package_name"

    iget-object v2, p0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    const-string v1, "info"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 702
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);"

    new-array v2, v9, [Ljava/lang/Object;

    const-string v3, "identifiers"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "key"

    aput-object v3, v2, v7

    const-string v3, "value"

    aput-object v3, v2, v8

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 705
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER NOT NULL, %s TEXT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)"

    const/16 v2, 0x13

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "amp_rules"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "campaign_id"

    aput-object v3, v2, v7

    const-string v3, "expiration"

    aput-object v3, v2, v8

    const-string v3, "display_seconds"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "display_session"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "version"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "phone_location"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "phone_size_width"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "phone_size_height"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "tablet_location"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "tablet_size_width"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "tablet_size_height"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "time_to_display"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "internet_required"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "ab_test"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "rule_name"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "location"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "devices"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 742
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "amp_ruleevent"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "event_name"

    aput-object v3, v2, v7

    const-string v3, "rule_id_ref"

    aput-object v3, v2, v8

    const-string v3, "amp_rules"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "_id"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 749
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL);"

    new-array v2, v9, [Ljava/lang/Object;

    const-string v3, "amp_displayed"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "displayed"

    aput-object v3, v2, v7

    const-string v3, "campaign_id"

    aput-object v3, v2, v8

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 756
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "amp_conditions"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "attribute_name"

    aput-object v3, v2, v7

    const-string v3, "operator"

    aput-object v3, v2, v8

    const-string v3, "rule_id_ref"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "amp_rules"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "_id"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 765
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "amp_condition_values"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "value"

    aput-object v3, v2, v7

    const-string v3, "condition_id_ref"

    aput-object v3, v2, v8

    const-string v3, "amp_conditions"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "_id"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 772
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);"

    new-array v2, v9, [Ljava/lang/Object;

    const-string v3, "custom_dimensions"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "custom_dimension_key"

    aput-object v3, v2, v7

    const-string v3, "custom_dimension_value"

    aput-object v3, v2, v8

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 775
    const-string v1, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s TEXT, %s INTEGER)"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "profile"

    aput-object v3, v2, v5

    const-string v3, "_id"

    aput-object v3, v2, v6

    const-string v3, "attribute"

    aput-object v3, v2, v7

    const-string v3, "customer_id"

    aput-object v3, v2, v8

    const-string v3, "action"

    aput-object v3, v2, v9

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 785
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 790
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 792
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_1f

    .line 794
    const-string v0, "Localytics"

    const-string v1, "SQLite library version is: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "select sqlite_version()"

    const/4 v5, 0x0

    invoke-static {p1, v4, v5}, Landroid/database/DatabaseUtils;->stringForQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    :cond_1f
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_2a

    .line 802
    const-string v0, "PRAGMA foreign_keys = ON;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 817
    :cond_2a
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 27
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 826
    const/4 v4, 0x3

    move/from16 v0, p2

    if-ge v0, v4, :cond_3b

    .line 828
    const-string v4, "upload_blob_events"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 829
    const-string v4, "event_history"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 830
    const-string v4, "upload_blobs"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 831
    const-string v4, "attributes"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 832
    const-string v4, "events"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 833
    const-string v4, "sessions"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 836
    :cond_3b
    const/4 v4, 0x4

    move/from16 v0, p2

    if-ge v0, v4, :cond_58

    .line 840
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "sessions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "iu"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 843
    :cond_58
    const/4 v4, 0x5

    move/from16 v0, p2

    if-ge v0, v4, :cond_75

    .line 845
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "sessions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "device_wifi_mac_hash"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 848
    :cond_75
    const/4 v4, 0x6

    move/from16 v0, p2

    if-ge v0, v4, :cond_113

    .line 850
    const/4 v13, 0x0

    .line 853
    .local v13, "attributesCursor":Landroid/database/Cursor;
    :try_start_7b
    const-string v5, "attributes"

    const/4 v4, 0x2

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v7, "_id"

    aput-object v7, v6, v4

    const/4 v4, 0x1

    const-string v7, "attribute_key"

    aput-object v7, v6, v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 858
    const-string v4, "_id"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    .line 859
    .local v16, "idColumnIndex":I
    const-string v4, "attribute_key"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v17

    .line 861
    .local v17, "keyColumnIndex":I
    new-instance v19, Landroid/content/ContentValues;

    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 862
    .local v19, "tempValues":Landroid/content/ContentValues;
    const-string v4, "%s = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 863
    .local v22, "whereClause":Ljava/lang/String;
    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v21, v0

    .line 865
    .local v21, "whereArgs":[Ljava/lang/String;
    const/4 v4, -0x1

    invoke-interface {v13, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 866
    :goto_bd
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_10d

    .line 868
    const-string v4, "attribute_key"

    const-string v5, "%s:%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    move/from16 v0, v17

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    const/4 v4, 0x0

    move/from16 v0, v16

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v21, v4

    .line 871
    const-string v4, "attributes"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v22

    move-object/from16 v3, v21

    invoke-virtual {v0, v4, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 873
    invoke-virtual/range {v19 .. v19}, Landroid/content/ContentValues;->clear()V
    :try_end_104
    .catchall {:try_start_7b .. :try_end_104} :catchall_105

    goto :goto_bd

    .line 878
    .end local v16    # "idColumnIndex":I
    .end local v17    # "keyColumnIndex":I
    .end local v19    # "tempValues":Landroid/content/ContentValues;
    .end local v21    # "whereArgs":[Ljava/lang/String;
    .end local v22    # "whereClause":Ljava/lang/String;
    :catchall_105
    move-exception v4

    if-eqz v13, :cond_10c

    .line 880
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 881
    const/4 v13, 0x0

    :cond_10c
    throw v4

    .line 878
    .restart local v16    # "idColumnIndex":I
    .restart local v17    # "keyColumnIndex":I
    .restart local v19    # "tempValues":Landroid/content/ContentValues;
    .restart local v21    # "whereArgs":[Ljava/lang/String;
    .restart local v22    # "whereClause":Ljava/lang/String;
    :cond_10d
    if-eqz v13, :cond_113

    .line 880
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 881
    const/4 v13, 0x0

    .line 886
    .end local v13    # "attributesCursor":Landroid/database/Cursor;
    .end local v16    # "idColumnIndex":I
    .end local v17    # "keyColumnIndex":I
    .end local v19    # "tempValues":Landroid/content/ContentValues;
    .end local v21    # "whereArgs":[Ljava/lang/String;
    .end local v22    # "whereClause":Ljava/lang/String;
    :cond_113
    const/4 v4, 0x7

    move/from16 v0, p2

    if-ge v0, v4, :cond_154

    .line 889
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s TEXT, %s INTEGER);"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "fb_attribution"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "first_run"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 890
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 891
    .local v20, "values":Landroid/content/ContentValues;
    const-string v4, "fb_attribution"

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 892
    const-string v4, "first_run"

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 893
    const-string v4, "info"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 896
    .end local v20    # "values":Landroid/content/ContentValues;
    :cond_154
    const/16 v4, 0x8

    move/from16 v0, p2

    if-ge v0, v4, :cond_17c

    .line 899
    const-string v4, "CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "identifiers"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "key"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "value"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 902
    :cond_17c
    const/16 v4, 0x9

    move/from16 v0, p2

    if-ge v0, v4, :cond_19a

    .line 905
    const-string v4, "ALTER TABLE %s ADD COLUMN %s INTEGER NOT NULL DEFAULT 0;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "clv_increase"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 908
    :cond_19a
    const/16 v4, 0xa

    move/from16 v0, p2

    if-ge v0, v4, :cond_1b8

    .line 911
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "play_attribution"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 914
    :cond_1b8
    const/16 v4, 0xb

    move/from16 v0, p2

    if-ge v0, v4, :cond_1ee

    .line 917
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "registration_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 918
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "registration_version"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 921
    :cond_1ee
    const/16 v4, 0xc

    move/from16 v0, p2

    if-ge v0, v4, :cond_291

    .line 924
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "first_android_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 925
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "first_telephony_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 926
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "package_name"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 927
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 928
    .restart local v20    # "values":Landroid/content/ContentValues;
    const-string v4, "first_android_id"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/localytics/android/DatapointHelper;->getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    const-string v4, "first_telephony_id"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/localytics/android/DatapointHelper;->getTelephonyDeviceIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 930
    const-string v4, "package_name"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 931
    const-string v4, "info"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 934
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "sessions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "device_android_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 937
    .end local v20    # "values":Landroid/content/ContentValues;
    :cond_291
    const/16 v4, 0xd

    move/from16 v0, p2

    if-ge v0, v4, :cond_2c7

    .line 940
    const-string v4, "ALTER TABLE %s ADD COLUMN %s REAL;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "event_lat"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 941
    const-string v4, "ALTER TABLE %s ADD COLUMN %s REAL;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "event_lng"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 944
    :cond_2c7
    const/16 v4, 0xe

    move/from16 v0, p2

    if-ge v0, v4, :cond_3f1

    .line 947
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER NOT NULL, %s TEXT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)"

    const/16 v5, 0x13

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "amp_rules"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "expiration"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "display_seconds"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "display_session"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "version"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string v7, "phone_location"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string v7, "phone_size_width"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string v7, "phone_size_height"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string v7, "tablet_location"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string v7, "tablet_size_width"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "tablet_size_height"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, "time_to_display"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, "internet_required"

    aput-object v7, v5, v6

    const/16 v6, 0xf

    const-string v7, "ab_test"

    aput-object v7, v5, v6

    const/16 v6, 0x10

    const-string v7, "rule_name"

    aput-object v7, v5, v6

    const/16 v6, 0x11

    const-string v7, "location"

    aput-object v7, v5, v6

    const/16 v6, 0x12

    const-string v7, "devices"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 984
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "amp_ruleevent"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "event_name"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "rule_id_ref"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "amp_rules"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 991
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL);"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "amp_displayed"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "displayed"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 998
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/4 v5, 0x7

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "amp_conditions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "attribute_name"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "operator"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "rule_id_ref"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "amp_rules"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1007
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "amp_condition_values"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "value"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "condition_id_ref"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "amp_conditions"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1014
    :cond_3f1
    const/16 v4, 0xf

    move/from16 v0, p2

    if-ge v0, v4, :cond_419

    .line 1017
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "custom_dimensions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "custom_dimension_key"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "custom_dimension_value"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1020
    :cond_419
    const/16 v4, 0x10

    move/from16 v0, p2

    if-ge v0, v4, :cond_49e

    .line 1023
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "first_advertising_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1024
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 1025
    .restart local v20    # "values":Landroid/content/ContentValues;
    const-string v4, "first_advertising_id"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/LocalyticsProvider$DatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/localytics/android/DatapointHelper;->getAdvertisingIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1026
    const-string v4, "info"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1029
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "sessions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "device_advertising_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1032
    const-string v4, "ALTER TABLE %s ADD COLUMN %s INTEGER;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "push_disabled"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1035
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "sender_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1038
    .end local v20    # "values":Landroid/content/ContentValues;
    :cond_49e
    const/16 v4, 0x11

    move/from16 v0, p2

    if-ge v0, v4, :cond_543

    .line 1041
    const-string v4, "CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s INTEGER)"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "profile"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "attribute"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "action"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1051
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "customer_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1052
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "user_type"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1053
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT;"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "events"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "ids"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1056
    const-string v4, "ALTER TABLE %s ADD COLUMN %s INTEGER"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "info"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "last_session_open_time"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1059
    const-string v4, "ALTER TABLE %s ADD COLUMN %s INTEGER NOT NULL CHECK (%s >= 0) DEFAULT 0"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "sessions"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "elapsed"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "elapsed"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1062
    :cond_543
    const/16 v4, 0x12

    move/from16 v0, p2

    if-ge v0, v4, :cond_5fa

    .line 1064
    const-string v4, "ALTER TABLE %s ADD COLUMN %s TEXT"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "profile"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "customer_id"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1065
    const/4 v14, 0x0

    .line 1066
    .local v14, "cursor":Landroid/database/Cursor;
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 1071
    .restart local v20    # "values":Landroid/content/ContentValues;
    :try_start_567
    const-string v5, "profile"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 1072
    :goto_575
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_5f4

    .line 1074
    const-string v4, "_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    :try_end_588
    .catchall {:try_start_567 .. :try_end_588} :catchall_5ec

    move-result-object v18

    .line 1077
    .local v18, "rowID":Ljava/lang/String;
    :try_start_589
    new-instance v12, Lorg/json/JSONObject;

    const-string v4, "attribute"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v12, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1078
    .local v12, "attributeJSON":Lorg/json/JSONObject;
    const-string v4, "attribute"

    const-string v5, "attributes"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1079
    const-string v4, "customer_id"

    const-string v5, "id"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1080
    const-string v4, "profile"

    const-string v5, "%s = %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "_id"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v18, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1081
    invoke-virtual/range {v20 .. v20}, Landroid/content/ContentValues;->clear()V
    :try_end_5d0
    .catch Ljava/lang/Exception; {:try_start_589 .. :try_end_5d0} :catch_5d1
    .catchall {:try_start_589 .. :try_end_5d0} :catchall_5ec

    goto :goto_575

    .line 1083
    .end local v12    # "attributeJSON":Lorg/json/JSONObject;
    :catch_5d1
    move-exception v15

    .line 1085
    .local v15, "e":Ljava/lang/Exception;
    :try_start_5d2
    const-string v4, "profile"

    const-string v5, "%s = %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "_id"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v18, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_5eb
    .catchall {:try_start_5d2 .. :try_end_5eb} :catchall_5ec

    goto :goto_575

    .line 1091
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v18    # "rowID":Ljava/lang/String;
    :catchall_5ec
    move-exception v4

    if-eqz v14, :cond_5f3

    .line 1093
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1094
    const/4 v14, 0x0

    :cond_5f3
    throw v4

    .line 1091
    :cond_5f4
    if-eqz v14, :cond_5fa

    .line 1093
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1094
    const/4 v14, 0x0

    .line 1098
    .end local v14    # "cursor":Landroid/database/Cursor;
    .end local v20    # "values":Landroid/content/ContentValues;
    :cond_5fa
    return-void
.end method
