.class Lcom/localytics/android/SessionHandler;
.super Landroid/os/Handler;
.source "SessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/SessionHandler$17;
    }
.end annotation


# static fields
.field private static final CUSTOM_DIMENSION_KEYS:[Ljava/lang/String;

.field private static final EVENTS_SORT_ORDER:Ljava/lang/String;

.field private static final JOINER_ARG_UPLOAD_EVENTS_COLUMNS:[Ljava/lang/String;

.field private static final PROJECTION_FLOW_BLOBS:[Ljava/lang/String;

.field private static final PROJECTION_FLOW_EVENTS:[Ljava/lang/String;

.field private static final PROJECTION_GET_INSTALLATION_ID:[Ljava/lang/String;

.field private static final PROJECTION_GET_NUMBER_OF_SESSIONS:[Ljava/lang/String;

.field private static final PROJECTION_GET_OPEN_SESSION_ID_EVENT_COUNT:[Ljava/lang/String;

.field private static final PROJECTION_GET_OPEN_SESSION_ID_SESSION_ID:[Ljava/lang/String;

.field private static final PROJECTION_INIT_API_KEY:[Ljava/lang/String;

.field private static final PROJECTION_IS_OPTED_OUT:[Ljava/lang/String;

.field private static final PROJECTION_OPEN_BLOB_EVENTS:[Ljava/lang/String;

.field private static final PROJECTION_OPEN_CLOSED_SESSION:[Ljava/lang/String;

.field private static final PROJECTION_OPEN_DELETE_EMPTIES_EVENT_ID:[Ljava/lang/String;

.field private static final PROJECTION_OPEN_DELETE_EMPTIES_PROCESSED_IN_BLOB:[Ljava/lang/String;

.field private static final PROJECTION_OPEN_EVENT_ID:[Ljava/lang/String;

.field private static final PROJECTION_OPEN_SESSIONS:[Ljava/lang/String;

.field private static final PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

.field private static final PROJECTION_SET_IDENTIFIER:[Ljava/lang/String;

.field private static final PROJECTION_TAG_EVENT:[Ljava/lang/String;

.field private static final PROJECTION_TAG_SCREEN:[Ljava/lang/String;

.field private static final PROJECTION_UPLOAD_BLOBS:[Ljava/lang/String;

.field private static final PROJECTION_UPLOAD_EVENTS:[Ljava/lang/String;

.field private static final SELECTION_ARGS_FLOW_EVENTS:[Ljava/lang/String;

.field private static final SELECTION_FLOW_EVENTS:Ljava/lang/String;

.field private static final SELECTION_GET_INSTALLATION_ID:Ljava/lang/String;

.field private static final SELECTION_GET_OPEN_SESSION_ID_EVENT_COUNT:Ljava/lang/String;

.field private static final SELECTION_INIT_API_KEY:Ljava/lang/String;

.field private static final SELECTION_IS_OPTED_OUT:Ljava/lang/String;

.field private static final SELECTION_OPEN:Ljava/lang/String;

.field private static final SELECTION_OPEN_CLOSED_SESSION:Ljava/lang/String;

.field private static final SELECTION_OPEN_CLOSED_SESSION_ATTRIBUTES:Ljava/lang/String;

.field private static final SELECTION_OPEN_DELETE_EMPTIES_EVENTS_SESSION_KEY_REF:Ljava/lang/String;

.field private static final SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF:Ljava/lang/String;

.field private static final SELECTION_OPEN_DELETE_EMPTIES_SESSIONS_ID:Ljava/lang/String;

.field private static final SELECTION_OPEN_DELETE_EMPTIES_UPLOAD_BLOBS_ID:Ljava/lang/String;

.field private static final SELECTION_OPEN_NEW_SESSION:Ljava/lang/String;

.field private static final SELECTION_OPT_IN_OUT:Ljava/lang/String;

.field private static final SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

.field private static final SELECTION_SET_IDENTIFIER:Ljava/lang/String;

.field private static final SELECTION_TAG_EVENT:Ljava/lang/String;

.field private static final SELECTION_TAG_SCREEN:Ljava/lang/String;

.field private static final SELECTION_UPLOAD_NULL_BLOBS:Ljava/lang/String;

.field private static final SORT_ORDER_TAG_SCREEN:Ljava/lang/String;

.field private static final UPLOAD_BLOBS_EVENTS_SORT_ORDER:Ljava/lang/String;

.field protected static final sIsUploadingMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field protected static final sIsUploadingProfileMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static sLastLocation:Landroid/location/Location;

.field protected static final sProfileUploadHandlerThread:Landroid/os/HandlerThread;

.field protected static final sUploadHandlerThread:Landroid/os/HandlerThread;


# instance fields
.field protected final mApiKey:Ljava/lang/String;

.field private mApiKeyId:J

.field protected final mContext:Landroid/content/Context;

.field private mProfileUploadHandler:Lcom/localytics/android/UploadHandler;

.field protected mProvider:Lcom/localytics/android/LocalyticsProvider;

.field private mUploadHandler:Lcom/localytics/android/UploadHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 212
    const-string v0, "CAST(%s AS TEXT)"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "events_key_ref"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->UPLOAD_BLOBS_EVENTS_SORT_ORDER:Ljava/lang/String;

    .line 219
    const-string v0, "CAST(%s as TEXT)"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->EVENTS_SORT_ORDER:Ljava/lang/String;

    .line 228
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    .line 237
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    .line 247
    const-class v0, Lcom/localytics/android/UploadHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/SessionHandler;->getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->sUploadHandlerThread:Landroid/os/HandlerThread;

    .line 257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lcom/localytics/android/UploadHandler;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_profiles"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/SessionHandler;->getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->sProfileUploadHandlerThread:Landroid/os/HandlerThread;

    .line 302
    const/4 v0, 0x0

    sput-object v0, Lcom/localytics/android/SessionHandler;->sLastLocation:Landroid/location/Location;

    .line 1024
    new-array v0, v7, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "opt_out"

    aput-object v1, v0, v4

    const-string v1, "created_time"

    aput-object v1, v0, v5

    const-string v1, "uuid"

    aput-object v1, v0, v6

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_INIT_API_KEY:[Ljava/lang/String;

    .line 1034
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "api_key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_INIT_API_KEY:Ljava/lang/String;

    .line 1144
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPT_IN_OUT:Ljava/lang/String;

    .line 1200
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_OPEN_SESSION_ID_SESSION_ID:[Ljava/lang/String;

    .line 1206
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_count"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_OPEN_SESSION_ID_EVENT_COUNT:[Ljava/lang/String;

    .line 1212
    const-string v0, "%s = ? AND %s = ?"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "session_key_ref"

    aput-object v2, v1, v3

    const-string v2, "event_name"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_GET_OPEN_SESSION_ID_EVENT_COUNT:Ljava/lang/String;

    .line 1289
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_EVENT_ID:[Ljava/lang/String;

    .line 1295
    const-string v0, "%s = ? AND %s >= ?"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "event_name"

    aput-object v2, v1, v3

    const-string v2, "wall_time"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN:Ljava/lang/String;

    .line 1300
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "events_key_ref"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_BLOB_EVENTS:[Ljava/lang/String;

    .line 1306
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "session_start_wall_time"

    aput-object v1, v0, v4

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_SESSIONS:[Ljava/lang/String;

    .line 1314
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "api_key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_NEW_SESSION:Ljava/lang/String;

    .line 1319
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "session_key_ref"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF:Ljava/lang/String;

    .line 1324
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "session_key_ref"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_EVENTS_SESSION_KEY_REF:Ljava/lang/String;

    .line 1329
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_DELETE_EMPTIES_EVENT_ID:[Ljava/lang/String;

    .line 1335
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "processed_in_blob"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_DELETE_EMPTIES_PROCESSED_IN_BLOB:[Ljava/lang/String;

    .line 1341
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_UPLOAD_BLOBS_ID:Ljava/lang/String;

    .line 1346
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_SESSIONS_ID:Ljava/lang/String;

    .line 1712
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "uuid"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_INSTALLATION_ID:[Ljava/lang/String;

    .line 1718
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "api_key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_GET_INSTALLATION_ID:Ljava/lang/String;

    .line 1788
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "session_key_ref"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_CLOSED_SESSION:[Ljava/lang/String;

    .line 1794
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_CLOSED_SESSION:Ljava/lang/String;

    .line 1799
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "events_key_ref"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_CLOSED_SESSION_ATTRIBUTES:Ljava/lang/String;

    .line 1849
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_NUMBER_OF_SESSIONS:[Ljava/lang/String;

    .line 1908
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "session_start_wall_time"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_TAG_EVENT:[Ljava/lang/String;

    .line 1914
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_TAG_EVENT:Ljava/lang/String;

    .line 2127
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "name"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_TAG_SCREEN:[Ljava/lang/String;

    .line 2133
    const-string v0, "%s = ? AND %s = ?"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "type"

    aput-object v2, v1, v3

    const-string v2, "session_key_ref"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_TAG_SCREEN:Ljava/lang/String;

    .line 2138
    const-string v0, "%s DESC"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SORT_ORDER_TAG_SCREEN:Ljava/lang/String;

    .line 2215
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "key"

    aput-object v1, v0, v3

    const-string v1, "value"

    aput-object v1, v0, v4

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_SET_IDENTIFIER:[Ljava/lang/String;

    .line 2220
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_SET_IDENTIFIER:Ljava/lang/String;

    .line 2272
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "custom_dimension_value"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

    .line 2277
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "custom_dimension_key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

    .line 2282
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    sget-object v1, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_1:Ljava/lang/String;

    aput-object v1, v0, v3

    sget-object v1, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_2:Ljava/lang/String;

    aput-object v1, v0, v4

    sget-object v1, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_3:Ljava/lang/String;

    aput-object v1, v0, v5

    sget-object v1, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_4:Ljava/lang/String;

    aput-object v1, v0, v6

    sget-object v1, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_5:Ljava/lang/String;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_6:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_7:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_8:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_9:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$CustomDimensionsDbColumns;->CUSTOM_DIMENSION_10:Ljava/lang/String;

    aput-object v2, v0, v1

    sput-object v0, Lcom/localytics/android/SessionHandler;->CUSTOM_DIMENSION_KEYS:[Ljava/lang/String;

    .line 2432
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_FLOW_EVENTS:[Ljava/lang/String;

    .line 2438
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "event_name"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_FLOW_EVENTS:Ljava/lang/String;

    .line 2443
    new-array v0, v4, [Ljava/lang/String;

    sget-object v1, Lcom/localytics/android/Constants;->FLOW_EVENT:Ljava/lang/String;

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_ARGS_FLOW_EVENTS:[Ljava/lang/String;

    .line 2449
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "events_key_ref"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_FLOW_BLOBS:[Ljava/lang/String;

    .line 2513
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "event_name"

    aput-object v1, v0, v4

    const-string v1, "wall_time"

    aput-object v1, v0, v5

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_UPLOAD_EVENTS:[Ljava/lang/String;

    .line 2522
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "events_key_ref"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_UPLOAD_BLOBS:[Ljava/lang/String;

    .line 2528
    const-string v0, "%s IS NULL"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "processed_in_blob"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_UPLOAD_NULL_BLOBS:Ljava/lang/String;

    .line 2533
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->JOINER_ARG_UPLOAD_EVENTS_COLUMNS:[Ljava/lang/String;

    .line 2739
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "opt_out"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_IS_OPTED_OUT:[Ljava/lang/String;

    .line 2747
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "api_key"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_IS_OPTED_OUT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 367
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 371
    if-nez p1, :cond_d

    .line 373
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 375
    :cond_d
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 377
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 381
    :cond_1b
    iput-object p1, p0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    .line 382
    iput-object p2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    .line 383
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/SessionHandler;)Z
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/SessionHandler;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/localytics/android/SessionHandler;->isPushDisabled()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100()[Ljava/lang/String;
    .registers 1

    .prologue
    .line 55
    sget-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .registers 1

    .prologue
    .line 55
    sget-object v0, Lcom/localytics/android/SessionHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

    return-object v0
.end method

.method private conditionallyAddFlowEvent()V
    .registers 14

    .prologue
    const/4 v12, 0x0

    .line 2462
    const/4 v8, 0x0

    .line 2464
    .local v8, "foundUnassociatedFlowEvent":Z
    const/4 v7, 0x0

    .line 2465
    .local v7, "eventsCursor":Landroid/database/Cursor;
    const/4 v6, 0x0

    .line 2468
    .local v6, "blob_eventsCursor":Landroid/database/Cursor;
    :try_start_4
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "events"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_FLOW_EVENTS:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_FLOW_EVENTS:Ljava/lang/String;

    sget-object v4, Lcom/localytics/android/SessionHandler;->SELECTION_ARGS_FLOW_EVENTS:[Ljava/lang/String;

    sget-object v5, Lcom/localytics/android/SessionHandler;->EVENTS_SORT_ORDER:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 2470
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "upload_blob_events"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_FLOW_BLOBS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    sget-object v5, Lcom/localytics/android/SessionHandler;->UPLOAD_BLOBS_EVENTS_SORT_ORDER:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2472
    new-instance v10, Landroid/database/CursorJoiner;

    sget-object v0, Lcom/localytics/android/SessionHandler;->PROJECTION_FLOW_EVENTS:[Ljava/lang/String;

    sget-object v1, Lcom/localytics/android/SessionHandler;->PROJECTION_FLOW_BLOBS:[Ljava/lang/String;

    invoke-direct {v10, v7, v0, v6, v1}, Landroid/database/CursorJoiner;-><init>(Landroid/database/Cursor;[Ljava/lang/String;Landroid/database/Cursor;[Ljava/lang/String;)V

    .line 2473
    .local v10, "joiner":Landroid/database/CursorJoiner;
    invoke-virtual {v10}, Landroid/database/CursorJoiner;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_2f
    :pswitch_2f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/database/CursorJoiner$Result;

    .line 2475
    .local v11, "joinerResult":Landroid/database/CursorJoiner$Result;
    sget-object v0, Lcom/localytics/android/SessionHandler$17;->$SwitchMap$android$database$CursorJoiner$Result:[I

    invoke-virtual {v11}, Landroid/database/CursorJoiner$Result;->ordinal()I

    move-result v1

    aget v0, v0, v1
    :try_end_43
    .catchall {:try_start_4 .. :try_end_43} :catchall_5d

    packed-switch v0, :pswitch_data_6c

    goto :goto_2f

    .line 2479
    :pswitch_47
    const/4 v8, 0x1

    .line 2480
    goto :goto_2f

    .line 2491
    .end local v11    # "joinerResult":Landroid/database/CursorJoiner$Result;
    :cond_49
    if-eqz v7, :cond_4f

    .line 2493
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2494
    const/4 v7, 0x0

    .line 2497
    :cond_4f
    if-eqz v6, :cond_55

    .line 2499
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2500
    const/4 v6, 0x0

    .line 2504
    :cond_55
    if-nez v8, :cond_5c

    .line 2506
    sget-object v0, Lcom/localytics/android/Constants;->FLOW_EVENT:Ljava/lang/String;

    invoke-virtual {p0, v0, v12}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 2508
    :cond_5c
    return-void

    .line 2491
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "joiner":Landroid/database/CursorJoiner;
    :catchall_5d
    move-exception v0

    if-eqz v7, :cond_64

    .line 2493
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2494
    const/4 v7, 0x0

    .line 2497
    :cond_64
    if-eqz v6, :cond_6a

    .line 2499
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2500
    const/4 v6, 0x0

    :cond_6a
    throw v0

    .line 2475
    nop

    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_47
        :pswitch_2f
    .end packed-switch
.end method

.method private static getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 267
    new-instance v0, Landroid/os/HandlerThread;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 269
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 276
    return-object v0
.end method

.method static getInstallationId(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "apiKey"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 1725
    const/4 v6, 0x0

    .line 1728
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    const-string v1, "api_keys"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_INSTALLATION_ID:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_GET_INSTALLATION_ID:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1731
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 1733
    const-string v0, "uuid"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_23
    .catchall {:try_start_2 .. :try_end_23} :catchall_3e

    move-result-object v0

    .line 1738
    if-eqz v6, :cond_2a

    .line 1740
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1741
    const/4 v6, 0x0

    .line 1752
    :cond_2a
    :goto_2a
    return-object v0

    .line 1738
    :cond_2b
    if-eqz v6, :cond_31

    .line 1740
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1741
    const/4 v6, 0x0

    .line 1748
    :cond_31
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_3c

    .line 1750
    const-string v0, "Localytics"

    const-string v1, "Installation ID couldn\'t be found"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3c
    move-object v0, v7

    .line 1752
    goto :goto_2a

    .line 1738
    :catchall_3e
    move-exception v0

    if-eqz v6, :cond_45

    .line 1740
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1741
    const/4 v6, 0x0

    :cond_45
    throw v0
.end method

.method static getNumberOfSessions(Lcom/localytics/android/LocalyticsProvider;)J
    .registers 8
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;

    .prologue
    .line 1860
    const/4 v6, 0x0

    .line 1863
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "sessions"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_NUMBER_OF_SESSIONS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1865
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_19

    move-result v0

    int-to-long v0, v0

    .line 1869
    if-eqz v6, :cond_18

    .line 1871
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1872
    const/4 v6, 0x0

    :cond_18
    return-wide v0

    .line 1869
    :catchall_19
    move-exception v0

    if-eqz v6, :cond_20

    .line 1871
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1872
    const/4 v6, 0x0

    :cond_20
    throw v0
.end method

.method static getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;
    .registers 11
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;

    .prologue
    const/4 v9, 0x0

    .line 1226
    const/4 v8, 0x0

    .line 1234
    .local v8, "sessionsCursor":Landroid/database/Cursor;
    :try_start_2
    const-string v1, "sessions"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_OPEN_SESSION_ID_SESSION_ID:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "_id"

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1236
    invoke-interface {v8}, Landroid/database/Cursor;->moveToLast()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 1238
    const-string v0, "_id"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_22
    .catchall {:try_start_2 .. :try_end_22} :catchall_61

    move-result-object v7

    .line 1247
    .local v7, "sessionId":Ljava/lang/Long;
    if-eqz v8, :cond_29

    .line 1249
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1250
    const/4 v8, 0x0

    .line 1258
    :cond_29
    const/4 v6, 0x0

    .line 1261
    .local v6, "eventsCursor":Landroid/database/Cursor;
    :try_start_2a
    const-string v1, "events"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_GET_OPEN_SESSION_ID_EVENT_COUNT:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_GET_OPEN_SESSION_ID_EVENT_COUNT:Ljava/lang/String;

    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v0, 0x1

    sget-object v5, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1266
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_69

    .line 1268
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_4f
    .catchall {:try_start_2a .. :try_end_4f} :catchall_71

    move-result v0

    if-nez v0, :cond_69

    .line 1276
    if-eqz v6, :cond_58

    .line 1278
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1279
    const/4 v6, 0x0

    .line 1283
    .end local v6    # "eventsCursor":Landroid/database/Cursor;
    .end local v7    # "sessionId":Ljava/lang/Long;
    :cond_58
    :goto_58
    return-object v7

    .line 1247
    :cond_59
    if-eqz v8, :cond_5f

    .line 1249
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1250
    const/4 v8, 0x0

    :cond_5f
    move-object v7, v9

    goto :goto_58

    .line 1247
    :catchall_61
    move-exception v0

    if-eqz v8, :cond_68

    .line 1249
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1250
    const/4 v8, 0x0

    :cond_68
    throw v0

    .line 1276
    .restart local v6    # "eventsCursor":Landroid/database/Cursor;
    .restart local v7    # "sessionId":Ljava/lang/Long;
    :cond_69
    if-eqz v6, :cond_6f

    .line 1278
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1279
    const/4 v6, 0x0

    :cond_6f
    move-object v7, v9

    .line 1283
    goto :goto_58

    .line 1276
    :catchall_71
    move-exception v0

    if-eqz v6, :cond_78

    .line 1278
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1279
    const/4 v6, 0x0

    :cond_78
    throw v0
.end method

.method static isOptedOut(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Z
    .registers 11
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "apiKey"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 2761
    if-nez p0, :cond_c

    .line 2763
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "provider cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2766
    :cond_c
    if-nez p1, :cond_16

    .line 2768
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "apiKey cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2772
    :cond_16
    const/4 v6, 0x0

    .line 2775
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_17
    const-string v1, "api_keys"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_IS_OPTED_OUT:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_IS_OPTED_OUT:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2778
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 2780
    const-string v0, "opt_out"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_38
    .catchall {:try_start_17 .. :try_end_38} :catchall_4d

    move-result v0

    if-eqz v0, :cond_43

    move v0, v7

    .line 2785
    :goto_3c
    if-eqz v6, :cond_42

    .line 2787
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2788
    const/4 v6, 0x0

    .line 2792
    :cond_42
    :goto_42
    return v0

    :cond_43
    move v0, v8

    .line 2780
    goto :goto_3c

    .line 2785
    :cond_45
    if-eqz v6, :cond_4b

    .line 2787
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2788
    const/4 v6, 0x0

    :cond_4b
    move v0, v8

    .line 2792
    goto :goto_42

    .line 2785
    :catchall_4d
    move-exception v0

    if-eqz v6, :cond_54

    .line 2787
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2788
    const/4 v6, 0x0

    :cond_54
    throw v0
.end method

.method private isPushDisabled()Z
    .registers 13

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 2401
    const/4 v7, 0x0

    .line 2402
    .local v7, "disabled":Z
    const/4 v6, 0x0

    .line 2405
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_4
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "push_disabled"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2406
    :goto_17
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 2408
    const-string v0, "push_disabled"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_26
    .catchall {:try_start_4 .. :try_end_26} :catchall_35

    move-result v9

    .line 2409
    .local v9, "disabledBit":I
    if-ne v9, v10, :cond_2b

    move v7, v10

    .line 2410
    :goto_2a
    goto :goto_17

    :cond_2b
    move v7, v11

    .line 2409
    goto :goto_2a

    .line 2414
    .end local v9    # "disabledBit":I
    :cond_2d
    if-eqz v6, :cond_33

    .line 2415
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2416
    const/4 v6, 0x0

    :cond_33
    move v8, v7

    .line 2418
    .end local v7    # "disabled":Z
    .local v8, "disabled":I
    :goto_34
    return v8

    .line 2414
    .end local v8    # "disabled":I
    .restart local v7    # "disabled":Z
    :catchall_35
    move-exception v0

    if-eqz v6, :cond_3c

    .line 2415
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2416
    const/4 v6, 0x0

    :cond_3c
    move v8, v7

    .line 2418
    .restart local v8    # "disabled":I
    goto :goto_34
.end method

.method private openClosedSession(J)V
    .registers 10
    .param p1, "closeEventId"    # J

    .prologue
    .line 1809
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 1812
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 1815
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_b
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "events"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_CLOSED_SESSION:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_CLOSED_SESSION:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1817
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 1819
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "attributes"

    sget-object v2, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_CLOSED_SESSION_ATTRIBUTES:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1820
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "events"

    sget-object v2, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_CLOSED_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_30
    .catchall {:try_start_b .. :try_end_30} :catchall_47

    .line 1838
    :goto_30
    if-eqz v6, :cond_36

    .line 1840
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1841
    const/4 v6, 0x0

    .line 1844
    :cond_36
    return-void

    .line 1828
    :cond_37
    :try_start_37
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_42

    .line 1830
    const-string v0, "Localytics"

    const-string v1, "Event no longer exists"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1833
    :cond_42
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/localytics/android/SessionHandler;->openNewSession(Ljava/util/Map;)V
    :try_end_46
    .catchall {:try_start_37 .. :try_end_46} :catchall_47

    goto :goto_30

    .line 1838
    :catchall_47
    move-exception v0

    if-eqz v6, :cond_4e

    .line 1840
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1841
    const/4 v6, 0x0

    :cond_4e
    throw v0
.end method

.method private openNewSession(Ljava/util/Map;)V
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1581
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/telephony/TelephonyManager;

    .line 1583
    .local v16, "telephonyManager":Landroid/telephony/TelephonyManager;
    const/4 v8, 0x0

    .line 1584
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 1585
    .local v14, "sessionStartTime":J
    const-wide/16 v10, 0x0

    .line 1588
    .local v10, "lastSessionStartTime":J
    :try_start_13
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "info"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1590
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 1592
    const-string v2, "last_session_open_time"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getLong(I)J
    :try_end_30
    .catchall {:try_start_13 .. :try_end_30} :catchall_19f

    move-result-wide v10

    .line 1597
    :cond_31
    const-wide/16 v2, 0x0

    cmp-long v2, v10, v2

    if-nez v2, :cond_38

    .line 1599
    move-wide v10, v14

    .line 1602
    :cond_38
    if-eqz v8, :cond_3e

    .line 1604
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1605
    const/4 v8, 0x0

    .line 1608
    :cond_3e
    new-instance v17, Landroid/content/ContentValues;

    invoke-direct/range {v17 .. v17}, Landroid/content/ContentValues;-><init>()V

    .line 1609
    .local v17, "values":Landroid/content/ContentValues;
    const-string v2, "api_key_ref"

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/localytics/android/SessionHandler;->mApiKeyId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1610
    const-string v2, "session_start_wall_time"

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1611
    const-string v2, "uuid"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1612
    const-string v2, "app_version"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1613
    const-string v2, "android_sdk"

    sget v3, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1614
    const-string v2, "android_version"

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1617
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getAndroidIdHashOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 1618
    .local v9, "deviceId":Ljava/lang/String;
    if-nez v9, :cond_9d

    .line 1620
    const-string v9, ""

    .line 1623
    :cond_9d
    const-string v2, "device_android_id_hash"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1624
    const-string v2, "device_android_id"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/localytics/android/DatapointHelper;->getAndroidIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1625
    const-string v2, "device_advertising_id"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/localytics/android/DatapointHelper;->getAdvertisingIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1626
    const-string v2, "device_country"

    invoke-virtual/range {v16 .. v16}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1627
    const-string v2, "device_manufacturer"

    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getManufacturer()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1628
    const-string v2, "device_model"

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1629
    const-string v2, "device_serial_number_hash"

    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getSerialNumberHashOrNull()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1630
    const-string v2, "device_telephony_id"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/localytics/android/DatapointHelper;->getTelephonyDeviceIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1631
    const-string v2, "device_telephony_id_hash"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1632
    const-string v2, "device_wifi_mac_hash"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1633
    const-string v2, "locale_country"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1634
    const-string v2, "locale_language"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1635
    const-string v2, "localytics_library_version"

    const-string v3, "androida_2.70"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1636
    const-string v2, "iu"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/localytics/android/SessionHandler;->getInstallationId(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1638
    const-string v2, "latitude"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1639
    const-string v2, "longitude"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1640
    const-string v2, "network_carrier"

    invoke-virtual/range {v16 .. v16}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1641
    const-string v2, "network_country"

    invoke-virtual/range {v16 .. v16}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1642
    const-string v2, "network_type"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    move-object/from16 v0, v16

    invoke-static {v3, v0}, Lcom/localytics/android/DatapointHelper;->getNetworkType(Landroid/content/Context;Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1644
    const-string v2, "elapsed"

    sub-long v4, v14, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1646
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "sessions"

    move-object/from16 v0, v17

    invoke-virtual {v2, v3, v0}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v12

    .line 1647
    .local v12, "sessionId":J
    const-wide/16 v2, -0x1

    cmp-long v2, v12, v2

    if-nez v2, :cond_1ae

    .line 1649
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "session insert failed"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 1597
    .end local v9    # "deviceId":Ljava/lang/String;
    .end local v12    # "sessionId":J
    .end local v17    # "values":Landroid/content/ContentValues;
    :catchall_19f
    move-exception v2

    const-wide/16 v4, 0x0

    cmp-long v3, v10, v4

    if-nez v3, :cond_1a7

    .line 1599
    move-wide v10, v14

    .line 1602
    :cond_1a7
    if-eqz v8, :cond_1ad

    .line 1604
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1605
    const/4 v8, 0x0

    :cond_1ad
    throw v2

    .line 1653
    .restart local v9    # "deviceId":Ljava/lang/String;
    .restart local v12    # "sessionId":J
    .restart local v17    # "values":Landroid/content/ContentValues;
    :cond_1ae
    invoke-virtual/range {v17 .. v17}, Landroid/content/ContentValues;->clear()V

    .line 1654
    const-string v2, "last_session_open_time"

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1655
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "info"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v2, v3, v0, v4, v5}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1657
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getAdvertisingIdOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/localytics/android/SessionHandler;->setFirstAdvertisingId(Ljava/lang/String;)V

    .line 1659
    sget-object v2, Lcom/localytics/android/Constants;->OPEN_EVENT:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 1664
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/LocalyticsProvider;->deleteOldFiles(Landroid/content/Context;)V

    .line 1665
    return-void
.end method

.method static preUploadBuildBlobs(Lcom/localytics/android/LocalyticsProvider;)V
    .registers 19
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;

    .prologue
    .line 2554
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 2556
    .local v10, "eventIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    const/4 v11, 0x0

    .line 2557
    .local v11, "eventsCursor":Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 2560
    .local v9, "blob_eventsCursor":Landroid/database/Cursor;
    :try_start_7
    const-string v3, "events"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_UPLOAD_EVENTS:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v7, Lcom/localytics/android/SessionHandler;->EVENTS_SORT_ORDER:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 2562
    const-string v3, "upload_blob_events"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_UPLOAD_BLOBS:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v7, Lcom/localytics/android/SessionHandler;->UPLOAD_BLOBS_EVENTS_SORT_ORDER:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2564
    const-string v2, "_id"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    .line 2565
    .local v13, "idColumn":I
    new-instance v14, Landroid/database/CursorJoiner;

    sget-object v2, Lcom/localytics/android/SessionHandler;->JOINER_ARG_UPLOAD_EVENTS_COLUMNS:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->PROJECTION_UPLOAD_BLOBS:[Ljava/lang/String;

    invoke-direct {v14, v11, v2, v9, v3}, Landroid/database/CursorJoiner;-><init>(Landroid/database/Cursor;[Ljava/lang/String;Landroid/database/Cursor;[Ljava/lang/String;)V

    .line 2566
    .local v14, "joiner":Landroid/database/CursorJoiner;
    invoke-virtual {v14}, Landroid/database/CursorJoiner;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :cond_36
    :goto_36
    :pswitch_36
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/database/CursorJoiner$Result;

    .line 2568
    .local v15, "joinerResult":Landroid/database/CursorJoiner$Result;
    sget-object v2, Lcom/localytics/android/SessionHandler$17;->$SwitchMap$android$database$CursorJoiner$Result:[I

    invoke-virtual {v15}, Landroid/database/CursorJoiner$Result;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_10a

    goto :goto_36

    .line 2572
    :pswitch_4e
    sget-object v2, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    const-string v3, "event_name"

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_75

    .line 2574
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-string v4, "wall_time"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    sub-long/2addr v2, v4

    sget-wide v4, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_36

    .line 2579
    :cond_75
    invoke-interface {v11, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v10, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_80
    .catchall {:try_start_7 .. :try_end_80} :catchall_81

    goto :goto_36

    .line 2591
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "idColumn":I
    .end local v14    # "joiner":Landroid/database/CursorJoiner;
    .end local v15    # "joinerResult":Landroid/database/CursorJoiner$Result;
    :catchall_81
    move-exception v2

    if-eqz v11, :cond_88

    .line 2593
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 2594
    const/4 v11, 0x0

    .line 2597
    :cond_88
    if-eqz v9, :cond_8e

    .line 2599
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2600
    const/4 v9, 0x0

    :cond_8e
    throw v2

    .line 2591
    .restart local v12    # "i$":Ljava/util/Iterator;
    .restart local v13    # "idColumn":I
    .restart local v14    # "joiner":Landroid/database/CursorJoiner;
    :cond_8f
    if-eqz v11, :cond_95

    .line 2593
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 2594
    const/4 v11, 0x0

    .line 2597
    :cond_95
    if-eqz v9, :cond_9b

    .line 2599
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2600
    const/4 v9, 0x0

    .line 2604
    :cond_9b
    invoke-interface {v10}, Ljava/util/Set;->size()I

    move-result v2

    if-lez v2, :cond_109

    .line 2607
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 2611
    .local v16, "values":Landroid/content/ContentValues;
    const-string v2, "uuid"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2612
    const-string v2, "upload_blobs"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v2, v1}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 2613
    .local v8, "blobId":Ljava/lang/Long;
    invoke-virtual/range {v16 .. v16}, Landroid/content/ContentValues;->clear()V

    .line 2616
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_ca
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Long;

    .line 2618
    .local v17, "x":Ljava/lang/Long;
    const-string v2, "upload_blobs_key_ref"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2619
    const-string v2, "events_key_ref"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2621
    const-string v2, "upload_blob_events"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v2, v1}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 2623
    invoke-virtual/range {v16 .. v16}, Landroid/content/ContentValues;->clear()V

    goto :goto_ca

    .line 2626
    .end local v17    # "x":Ljava/lang/Long;
    :cond_f3
    const-string v2, "processed_in_blob"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2627
    const-string v2, "event_history"

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_UPLOAD_NULL_BLOBS:Ljava/lang/String;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2628
    invoke-virtual/range {v16 .. v16}, Landroid/content/ContentValues;->clear()V

    .line 2630
    .end local v8    # "blobId":Ljava/lang/Long;
    .end local v16    # "values":Landroid/content/ContentValues;
    :cond_109
    return-void

    .line 2568
    :pswitch_data_10a
    .packed-switch 0x1
        :pswitch_4e
        :pswitch_36
    .end packed-switch
.end method

.method private setFirstAdvertisingId(Ljava/lang/String;)V
    .registers 12
    .param p1, "advertisingId"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 1674
    const/4 v7, 0x0

    .line 1676
    .local v7, "firstAdvertisingId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1679
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_3
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1681
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 1683
    const-string v0, "first_advertising_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_37

    move-result-object v7

    .line 1688
    :cond_1f
    if-eqz v6, :cond_25

    .line 1690
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1691
    const/4 v6, 0x0

    .line 1695
    :cond_25
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3f

    .line 1697
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_36

    .line 1699
    const-string v0, "Localytics"

    const-string v1, "First advertising id has already been set before."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1707
    :cond_36
    :goto_36
    return-void

    .line 1688
    :catchall_37
    move-exception v0

    if-eqz v6, :cond_3e

    .line 1690
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1691
    const/4 v6, 0x0

    :cond_3e
    throw v0

    .line 1704
    :cond_3f
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1705
    .local v8, "values":Landroid/content/ContentValues;
    const-string v0, "first_advertising_id"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1706
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    invoke-virtual {v0, v1, v8, v9, v9}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_36
.end method


# virtual methods
.method close(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1893
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v0}, Lcom/localytics/android/SessionHandler;->getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;

    move-result-object v0

    if-nez v0, :cond_14

    .line 1895
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_13

    .line 1897
    const-string v0, "Localytics"

    const-string v1, "Session was not open, so close is not possible."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1903
    :cond_13
    :goto_13
    return-void

    .line 1902
    :cond_14
    sget-object v0, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_13
.end method

.method protected createUploadHandler(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/UploadHandler;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionHandler"    # Landroid/os/Handler;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "installId"    # Ljava/lang/String;
    .param p5, "looper"    # Landroid/os/Looper;

    .prologue
    .line 331
    new-instance v0, Lcom/localytics/android/UploadHandler;

    move-object v1, p1

    move-object v2, p0

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/localytics/android/UploadHandler;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)V

    return-object v0
.end method

.method getCustomDimension(I)Ljava/lang/String;
    .registers 11
    .param p1, "dimension"    # I

    .prologue
    const/4 v8, 0x0

    .line 2361
    if-ltz p1, :cond_7

    const/16 v0, 0x9

    if-le p1, v0, :cond_8

    .line 2388
    :cond_7
    :goto_7
    return-object v8

    .line 2366
    :cond_8
    const/4 v8, 0x0

    .line 2367
    .local v8, "value":Ljava/lang/String;
    sget-object v0, Lcom/localytics/android/SessionHandler;->CUSTOM_DIMENSION_KEYS:[Ljava/lang/String;

    aget-object v7, v0, p1

    .line 2369
    .local v7, "key":Ljava/lang/String;
    const/4 v6, 0x0

    .line 2372
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_e
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "custom_dimensions"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v7, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2374
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 2376
    const-string v0, "custom_dimension_value"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_30
    .catchall {:try_start_e .. :try_end_30} :catchall_38

    move-result-object v8

    .line 2381
    :cond_31
    if-eqz v6, :cond_7

    .line 2383
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2384
    const/4 v6, 0x0

    goto :goto_7

    .line 2381
    :catchall_38
    move-exception v0

    if-eqz v6, :cond_3f

    .line 2383
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2384
    const/4 v6, 0x0

    :cond_3f
    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 28
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 390
    :try_start_0
    invoke-super/range {p0 .. p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 392
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_1e

    .line 394
    const-string v22, "Localytics"

    const-string v23, "Handler received %s"

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object p1, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    :cond_1e
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v22, v0

    packed-switch v22, :pswitch_data_34a

    .line 1003
    :pswitch_27
    new-instance v22, Ljava/lang/RuntimeException;

    const-string v23, "Fell through switch statement"

    invoke-direct/range {v22 .. v23}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_2f

    .line 1007
    :catch_2f
    move-exception v11

    .line 1009
    .local v11, "e":Ljava/lang/Exception;
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_3f

    .line 1011
    const-string v22, "Localytics"

    const-string v23, "Localytics library threw an uncaught exception"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1019
    .end local v11    # "e":Ljava/lang/Exception;
    :cond_3f
    :goto_3f
    return-void

    .line 401
    :pswitch_40
    :try_start_40
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_4b

    .line 403
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_INIT"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    :cond_4b
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v19, v0

    check-cast v19, Ljava/lang/String;

    .line 408
    .local v19, "referrerID":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->init(Ljava/lang/String;)V

    goto :goto_3f

    .line 414
    .end local v19    # "referrerID":Ljava/lang/String;
    :pswitch_5b
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_66

    .line 416
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_OPT_OUT"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    :cond_66
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v22, v0

    if-nez v22, :cond_82

    const/4 v14, 0x0

    .line 421
    .local v14, "isOptingOut":Z
    :goto_6f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$1;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v14}, Lcom/localytics/android/SessionHandler$1;-><init>(Lcom/localytics/android/SessionHandler;Z)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_3f

    .line 419
    .end local v14    # "isOptingOut":Z
    :cond_82
    const/4 v14, 0x1

    goto :goto_6f

    .line 433
    :pswitch_84
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_8f

    .line 435
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_OPEN"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    :cond_8f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$2;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/SessionHandler$2;-><init>(Lcom/localytics/android/SessionHandler;Landroid/os/Message;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_3f

    .line 451
    :pswitch_a4
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_af

    .line 453
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_CLOSE"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    :cond_af
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$3;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/SessionHandler$3;-><init>(Lcom/localytics/android/SessionHandler;Landroid/os/Message;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 469
    :pswitch_c5
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_d0

    .line 471
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_TAG_EVENT"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    :cond_d0
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, [Ljava/lang/Object;

    move-object/from16 v0, v22

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    .line 476
    .local v17, "params":[Ljava/lang/Object;
    const/16 v22, 0x0

    aget-object v12, v17, v22

    check-cast v12, Ljava/lang/String;

    .line 478
    .local v12, "event":Ljava/lang/String;
    const/16 v22, 0x1

    aget-object v5, v17, v22

    check-cast v5, Ljava/util/Map;

    .line 479
    .local v5, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v22, 0x2

    aget-object v7, v17, v22

    check-cast v7, Ljava/lang/Long;

    .line 481
    .local v7, "clv":Ljava/lang/Long;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$4;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12, v5, v7}, Lcom/localytics/android/SessionHandler$4;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 568
    .end local v5    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "clv":Ljava/lang/Long;
    .end local v12    # "event":Ljava/lang/String;
    .end local v17    # "params":[Ljava/lang/Object;
    :pswitch_104
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_10f

    .line 570
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_TAG_SCREEN"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    :cond_10f
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v20, v0

    check-cast v20, Ljava/lang/String;

    .line 575
    .local v20, "screen":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$5;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/SessionHandler$5;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 587
    .end local v20    # "screen":Ljava/lang/String;
    :pswitch_12d
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_138

    .line 589
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_SET_IDENTIFIER"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    :cond_138
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, [Ljava/lang/Object;

    move-object/from16 v0, v22

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    .line 593
    .restart local v17    # "params":[Ljava/lang/Object;
    const/16 v22, 0x0

    aget-object v15, v17, v22

    check-cast v15, Ljava/lang/String;

    .line 594
    .local v15, "key":Ljava/lang/String;
    const/16 v22, 0x1

    aget-object v21, v17, v22

    check-cast v21, Ljava/lang/String;

    .line 596
    .local v21, "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$6;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v15, v2}, Lcom/localytics/android/SessionHandler$6;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 608
    .end local v15    # "key":Ljava/lang/String;
    .end local v17    # "params":[Ljava/lang/Object;
    .end local v21    # "value":Ljava/lang/String;
    :pswitch_168
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_173

    .line 610
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_REGISTER_PUSH"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    :cond_173
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Ljava/lang/String;

    .line 615
    .local v16, "newSenderId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$7;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/SessionHandler$7;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 682
    .end local v16    # "newSenderId":Ljava/lang/String;
    :pswitch_191
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_19c

    .line 684
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_DISABLE_PUSH"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 687
    :cond_19c
    move-object/from16 v0, p1

    iget v10, v0, Landroid/os/Message;->arg1:I

    .line 689
    .local v10, "disabled":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$8;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v10}, Lcom/localytics/android/SessionHandler$8;-><init>(Lcom/localytics/android/SessionHandler;I)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 701
    .end local v10    # "disabled":I
    :pswitch_1b4
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_1bf

    .line 703
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_SET_PUSH_REGID"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    :cond_1bf
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, Ljava/lang/String;

    .line 708
    .local v18, "pushRegId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$9;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/SessionHandler$9;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 720
    .end local v18    # "pushRegId":Ljava/lang/String;
    :pswitch_1dd
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_1e8

    .line 722
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_SET_LOCATION"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    :cond_1e8
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, Landroid/location/Location;

    sput-object v22, Lcom/localytics/android/SessionHandler;->sLastLocation:Landroid/location/Location;

    goto/16 :goto_3f

    .line 731
    :pswitch_1f4
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_1ff

    .line 733
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_SET_CUSTOM_DIMENSION"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    :cond_1ff
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, [Ljava/lang/Object;

    move-object/from16 v0, v22

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    .line 737
    .restart local v17    # "params":[Ljava/lang/Object;
    const/16 v22, 0x0

    aget-object v22, v17, v22

    check-cast v22, Ljava/lang/Integer;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 738
    .local v9, "dimension":I
    const/16 v22, 0x1

    aget-object v21, v17, v22

    check-cast v21, Ljava/lang/String;

    .line 740
    .restart local v21    # "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$10;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v9, v2}, Lcom/localytics/android/SessionHandler$10;-><init>(Lcom/localytics/android/SessionHandler;ILjava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 752
    .end local v9    # "dimension":I
    .end local v17    # "params":[Ljava/lang/Object;
    .end local v21    # "value":Ljava/lang/String;
    :pswitch_233
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_23e

    .line 754
    const-string v22, "Localytics"

    const-string v23, "SessionHandler received MESSAGE_UPLOAD"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 760
    :cond_23e
    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Runnable;

    .line 762
    .local v6, "callback":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$11;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v6}, Lcom/localytics/android/SessionHandler$11;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/Runnable;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 774
    .end local v6    # "callback":Ljava/lang/Runnable;
    :pswitch_258
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_263

    .line 776
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_UPLOAD_CALLBACK"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    :cond_263
    sget-object v22, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    move-object/from16 v23, v0

    sget-object v24, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface/range {v22 .. v24}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3f

    .line 785
    :pswitch_272
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_27d

    .line 787
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_SET_PROFILE_ATTRIBUTE"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 790
    :cond_27d
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, [Ljava/lang/Object;

    move-object/from16 v0, v22

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    .line 791
    .restart local v17    # "params":[Ljava/lang/Object;
    const/16 v22, 0x0

    aget-object v4, v17, v22

    check-cast v4, Lorg/json/JSONObject;

    .line 792
    .local v4, "attributeJSON":Lorg/json/JSONObject;
    const/16 v22, 0x1

    aget-object v22, v17, v22

    check-cast v22, Ljava/lang/Integer;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 793
    .local v3, "action":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/localytics/android/LocalyticsProvider;->getUserIdAndType()Ljava/util/Map;

    move-result-object v22

    const-string v23, "id"

    invoke-interface/range {v22 .. v23}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 795
    .local v8, "customerID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$12;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v3, v8}, Lcom/localytics/android/SessionHandler$12;-><init>(Lcom/localytics/android/SessionHandler;Lorg/json/JSONObject;ILjava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 812
    .end local v3    # "action":I
    .end local v4    # "attributeJSON":Lorg/json/JSONObject;
    .end local v8    # "customerID":Ljava/lang/String;
    .end local v17    # "params":[Ljava/lang/Object;
    :pswitch_2c1
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_2cc

    .line 814
    const-string v22, "Localytics"

    const-string v23, "SessionHandler received MESSAGE_UPLOAD_PROFILE"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 820
    :cond_2cc
    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Runnable;

    .line 822
    .restart local v6    # "callback":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$13;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v6}, Lcom/localytics/android/SessionHandler$13;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/Runnable;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 834
    .end local v6    # "callback":Ljava/lang/Runnable;
    :pswitch_2e6
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_2f1

    .line 836
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_UPLOAD_PROFILE_CALLBACK"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    :cond_2f1
    sget-object v22, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    move-object/from16 v23, v0

    sget-object v24, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface/range {v22 .. v24}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3f

    .line 845
    :pswitch_300
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_30b

    .line 847
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_HANDLE_PUSH_REGISTRATION"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 850
    :cond_30b
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v13, Landroid/content/Intent;

    .line 852
    .local v13, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$14;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lcom/localytics/android/SessionHandler$14;-><init>(Lcom/localytics/android/SessionHandler;Landroid/content/Intent;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto/16 :goto_3f

    .line 903
    .end local v13    # "intent":Landroid/content/Intent;
    :pswitch_325
    sget-boolean v22, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v22, :cond_330

    .line 905
    const-string v22, "Localytics"

    const-string v23, "Handler received MESSAGE_HANDLE_PUSH_RECEIVED"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 908
    :cond_330
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v13, Landroid/content/Intent;

    .line 910
    .restart local v13    # "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v22, v0

    new-instance v23, Lcom/localytics/android/SessionHandler$15;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lcom/localytics/android/SessionHandler$15;-><init>(Lcom/localytics/android/SessionHandler;Landroid/content/Intent;)V

    invoke-virtual/range {v22 .. v23}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V
    :try_end_348
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_348} :catch_2f

    goto/16 :goto_3f

    .line 397
    :pswitch_data_34a
    .packed-switch 0x0
        :pswitch_40
        :pswitch_84
        :pswitch_a4
        :pswitch_c5
        :pswitch_233
        :pswitch_258
        :pswitch_5b
        :pswitch_104
        :pswitch_12d
        :pswitch_168
        :pswitch_1b4
        :pswitch_1dd
        :pswitch_1f4
        :pswitch_27
        :pswitch_191
        :pswitch_27
        :pswitch_272
        :pswitch_2c1
        :pswitch_2e6
        :pswitch_27
        :pswitch_300
        :pswitch_325
    .end packed-switch
.end method

.method init(Ljava/lang/String;)V
    .registers 14
    .param p1, "referrerID"    # Ljava/lang/String;

    .prologue
    const-wide/16 v10, 0x0

    .line 1048
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/localytics/android/LocalyticsProvider;->getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/localytics/android/LocalyticsProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    .line 1050
    const/4 v7, 0x0

    .line 1053
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_d
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "api_keys"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_INIT_API_KEY:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_INIT_API_KEY:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v4, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v9, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    aput-object v9, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1056
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_11b

    .line 1059
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_3f

    .line 1061
    const-string v0, "Localytics"

    const-string v1, "Loading details for API key %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v5, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    aput-object v5, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1064
    :cond_3f
    const-string v0, "_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/localytics/android/SessionHandler;->mApiKeyId:J

    .line 1066
    const-string v0, "created_time"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    cmp-long v0, v0, v10

    if-nez v0, :cond_7c

    .line 1068
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1069
    .local v8, "values":Landroid/content/ContentValues;
    const-string v0, "created_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1070
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "api_keys"

    sget-object v2, Lcom/localytics/android/SessionHandler;->SELECTION_INIT_API_KEY:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v9, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    aput-object v9, v3, v5

    invoke-virtual {v0, v1, v8, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_7c
    .catchall {:try_start_d .. :try_end_7c} :catchall_16d

    .line 1092
    .end local v8    # "values":Landroid/content/ContentValues;
    :cond_7c
    :goto_7c
    if-eqz v7, :cond_82

    .line 1094
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1095
    const/4 v7, 0x0

    .line 1101
    :cond_82
    :try_start_82
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "play_attribution"

    aput-object v5, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1103
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_c2

    .line 1105
    const-string v0, "play_attribution"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1106
    .local v6, "currentReferrerID":Ljava/lang/String;
    if-nez v6, :cond_c2

    if-eqz p1, :cond_c2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c2

    .line 1108
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1109
    .restart local v8    # "values":Landroid/content/ContentValues;
    const-string v0, "play_attribution"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1110
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v8, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_c2
    .catchall {:try_start_82 .. :try_end_c2} :catchall_177

    .line 1116
    .end local v6    # "currentReferrerID":Ljava/lang/String;
    .end local v8    # "values":Landroid/content/ContentValues;
    :cond_c2
    if-eqz v7, :cond_c8

    .line 1118
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1119
    const/4 v7, 0x0

    .line 1123
    :cond_c8
    sget-object v0, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_db

    .line 1125
    sget-object v0, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1128
    :cond_db
    sget-object v0, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_ee

    .line 1130
    sget-object v0, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1136
    :cond_ee
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/localytics/android/SessionHandler;->getInstallationId(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1137
    .local v4, "installationID":Ljava/lang/String;
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v0, Lcom/localytics/android/SessionHandler;->sUploadHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    move-object v0, p0

    move-object v2, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/SessionHandler;->createUploadHandler(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/UploadHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/SessionHandler;->mUploadHandler:Lcom/localytics/android/UploadHandler;

    .line 1138
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v0, Lcom/localytics/android/SessionHandler;->sProfileUploadHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    move-object v0, p0

    move-object v2, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/SessionHandler;->createUploadHandler(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/UploadHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/SessionHandler;->mProfileUploadHandler:Lcom/localytics/android/UploadHandler;

    .line 1139
    return-void

    .line 1076
    .end local v4    # "installationID":Ljava/lang/String;
    :cond_11b
    :try_start_11b
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_132

    .line 1078
    const-string v0, "Localytics"

    const-string v1, "Performing first-time initialization for new API key %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v5, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    aput-object v5, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1081
    :cond_132
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1082
    .restart local v8    # "values":Landroid/content/ContentValues;
    const-string v0, "api_key"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-virtual {v8, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1083
    const-string v0, "uuid"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1084
    const-string v0, "opt_out"

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1085
    const-string v2, "created_time"

    if-nez p1, :cond_175

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :goto_15a
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v8, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1087
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "api_keys"

    invoke-virtual {v0, v1, v8}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/localytics/android/SessionHandler;->mApiKeyId:J
    :try_end_16b
    .catchall {:try_start_11b .. :try_end_16b} :catchall_16d

    goto/16 :goto_7c

    .line 1092
    .end local v8    # "values":Landroid/content/ContentValues;
    :catchall_16d
    move-exception v0

    if-eqz v7, :cond_174

    .line 1094
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1095
    const/4 v7, 0x0

    :cond_174
    throw v0

    .restart local v8    # "values":Landroid/content/ContentValues;
    :cond_175
    move-wide v0, v10

    .line 1085
    goto :goto_15a

    .line 1116
    .end local v8    # "values":Landroid/content/ContentValues;
    :catchall_177
    move-exception v0

    if-eqz v7, :cond_17e

    .line 1118
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1119
    const/4 v7, 0x0

    :cond_17e
    throw v0
.end method

.method open(ZLjava/util/Map;)V
    .registers 31
    .param p1, "ignoreLimits"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1364
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v2}, Lcom/localytics/android/SessionHandler;->getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 1366
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_15

    .line 1368
    const-string v2, "Localytics"

    const-string v3, "Session was already open"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1571
    :cond_15
    :goto_15
    return-void

    .line 1374
    :cond_16
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/localytics/android/SessionHandler;->isOptedOut(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 1376
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_15

    .line 1378
    const-string v2, "Localytics"

    const-string v3, "Data collection is opted out"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 1388
    :cond_30
    const-wide/16 v12, -0x1

    .line 1391
    .local v12, "closeEventId":J
    const/4 v15, 0x0

    .line 1392
    .local v15, "eventsCursor":Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 1395
    .local v10, "blob_eventsCursor":Landroid/database/Cursor;
    :try_start_34
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "events"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_EVENT_ID:[Ljava/lang/String;

    sget-object v5, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN:Ljava/lang/String;

    const/4 v7, 0x2

    new-array v6, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    sget-object v24, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    aput-object v24, v6, v7

    const/4 v7, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    sget-wide v26, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    sub-long v24, v24, v26

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v24

    aput-object v24, v6, v7

    sget-object v7, Lcom/localytics/android/SessionHandler;->EVENTS_SORT_ORDER:Ljava/lang/String;

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 1399
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "upload_blob_events"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_BLOB_EVENTS:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v7, Lcom/localytics/android/SessionHandler;->UPLOAD_BLOBS_EVENTS_SORT_ORDER:Ljava/lang/String;

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1401
    const-string v2, "_id"

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v17

    .line 1402
    .local v17, "idColumn":I
    new-instance v18, Landroid/database/CursorJoiner;

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_EVENT_ID:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_BLOB_EVENTS:[Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-direct {v0, v15, v2, v10, v3}, Landroid/database/CursorJoiner;-><init>(Landroid/database/Cursor;[Ljava/lang/String;Landroid/database/Cursor;[Ljava/lang/String;)V

    .line 1404
    .local v18, "joiner":Landroid/database/CursorJoiner;
    invoke-virtual/range {v18 .. v18}, Landroid/database/CursorJoiner;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "i$":Ljava/util/Iterator;
    :cond_80
    :goto_80
    :pswitch_80
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c6

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/database/CursorJoiner$Result;

    .line 1406
    .local v19, "joinerResult":Landroid/database/CursorJoiner$Result;
    sget-object v2, Lcom/localytics/android/SessionHandler$17;->$SwitchMap$android$database$CursorJoiner$Result:[I

    invoke-virtual/range {v19 .. v19}, Landroid/database/CursorJoiner$Result;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_236

    goto :goto_80

    .line 1411
    :pswitch_98
    const-wide/16 v2, -0x1

    cmp-long v2, v2, v12

    if-eqz v2, :cond_b9

    .line 1416
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_a9

    .line 1418
    const-string v2, "Localytics"

    const-string v3, "There were multiple close events within SESSION_EXPIRATION"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1421
    :cond_a9
    const-string v2, "_id"

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 1422
    .local v20, "newClose":J
    cmp-long v2, v20, v12

    if-lez v2, :cond_b9

    .line 1424
    move-wide/from16 v12, v20

    .line 1428
    .end local v20    # "newClose":J
    :cond_b9
    const-wide/16 v2, -0x1

    cmp-long v2, v2, v12

    if-nez v2, :cond_80

    .line 1430
    move/from16 v0, v17

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_c4
    .catchall {:try_start_34 .. :try_end_c4} :catchall_ea

    move-result-wide v12

    goto :goto_80

    .line 1447
    .end local v19    # "joinerResult":Landroid/database/CursorJoiner$Result;
    :cond_c6
    if-eqz v15, :cond_cc

    .line 1449
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1450
    const/4 v15, 0x0

    .line 1452
    :cond_cc
    if-eqz v10, :cond_d2

    .line 1454
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1455
    const/4 v10, 0x0

    .line 1460
    :cond_d2
    const-wide/16 v2, -0x1

    cmp-long v2, v2, v12

    if-eqz v2, :cond_f8

    .line 1462
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_e3

    .line 1464
    const-string v2, "Localytics"

    const-string v3, "Opening old closed session and reconnecting"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1467
    :cond_e3
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/localytics/android/SessionHandler;->openClosedSession(J)V

    goto/16 :goto_15

    .line 1447
    .end local v16    # "i$":Ljava/util/Iterator;
    .end local v17    # "idColumn":I
    .end local v18    # "joiner":Landroid/database/CursorJoiner;
    :catchall_ea
    move-exception v2

    if-eqz v15, :cond_f1

    .line 1449
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1450
    const/4 v15, 0x0

    .line 1452
    :cond_f1
    if-eqz v10, :cond_f7

    .line 1454
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1455
    const/4 v10, 0x0

    :cond_f7
    throw v2

    .line 1471
    .restart local v16    # "i$":Ljava/util/Iterator;
    .restart local v17    # "idColumn":I
    .restart local v18    # "joiner":Landroid/database/CursorJoiner;
    :cond_f8
    const/16 v23, 0x0

    .line 1474
    .local v23, "sessionsCursor":Landroid/database/Cursor;
    :try_start_fa
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "sessions"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_SESSIONS:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "_id"

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v23

    .line 1476
    invoke-interface/range {v23 .. v23}, Landroid/database/Cursor;->moveToLast()Z

    move-result v2

    if-eqz v2, :cond_1fe

    .line 1478
    const-string v2, "session_start_wall_time"

    move-object/from16 v0, v23

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v23

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-wide v24, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    sub-long v4, v4, v24

    cmp-long v2, v2, v4

    if-ltz v2, :cond_13e

    .line 1482
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_135

    .line 1484
    const-string v2, "Localytics"

    const-string v3, "Opening old unclosed session and reconnecting"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_135
    .catchall {:try_start_fa .. :try_end_135} :catchall_1a9

    .line 1544
    :cond_135
    if-eqz v23, :cond_15

    .line 1546
    invoke-interface/range {v23 .. v23}, Landroid/database/Cursor;->close()V

    .line 1547
    const/16 v23, 0x0

    goto/16 :goto_15

    .line 1490
    :cond_13e
    const/4 v15, 0x0

    .line 1493
    :try_start_13f
    const-string v2, "_id"

    move-object/from16 v0, v23

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v23

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v22

    .line 1494
    .local v22, "sessionId":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v22, v6, v2

    .line 1496
    .local v6, "sessionIdSelection":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "events"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_DELETE_EMPTIES_EVENT_ID:[Ljava/lang/String;

    sget-object v5, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_EVENTS_SESSION_KEY_REF:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 1498
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-nez v2, :cond_1f8

    .line 1500
    new-instance v11, Ljava/util/LinkedList;

    invoke-direct {v11}, Ljava/util/LinkedList;-><init>()V
    :try_end_171
    .catchall {:try_start_13f .. :try_end_171} :catchall_1a1

    .line 1503
    .local v11, "blobsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const/4 v14, 0x0

    .line 1506
    .local v14, "eventHistory":Landroid/database/Cursor;
    :try_start_172
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "event_history"

    sget-object v4, Lcom/localytics/android/SessionHandler;->PROJECTION_OPEN_DELETE_EMPTIES_PROCESSED_IN_BLOB:[Ljava/lang/String;

    sget-object v5, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 1507
    :goto_181
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1b2

    .line 1509
    const-string v2, "processed_in_blob"

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_198
    .catchall {:try_start_172 .. :try_end_198} :catchall_199

    goto :goto_181

    .line 1514
    :catchall_199
    move-exception v2

    if-eqz v14, :cond_1a0

    .line 1516
    :try_start_19c
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1517
    const/4 v14, 0x0

    :cond_1a0
    throw v2
    :try_end_1a1
    .catchall {:try_start_19c .. :try_end_1a1} :catchall_1a1

    .line 1534
    .end local v6    # "sessionIdSelection":[Ljava/lang/String;
    .end local v11    # "blobsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v14    # "eventHistory":Landroid/database/Cursor;
    .end local v22    # "sessionId":Ljava/lang/String;
    :catchall_1a1
    move-exception v2

    if-eqz v15, :cond_1a8

    .line 1536
    :try_start_1a4
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1537
    const/4 v15, 0x0

    :cond_1a8
    throw v2
    :try_end_1a9
    .catchall {:try_start_1a4 .. :try_end_1a9} :catchall_1a9

    .line 1544
    :catchall_1a9
    move-exception v2

    if-eqz v23, :cond_1b1

    .line 1546
    invoke-interface/range {v23 .. v23}, Landroid/database/Cursor;->close()V

    .line 1547
    const/16 v23, 0x0

    :cond_1b1
    throw v2

    .line 1514
    .restart local v6    # "sessionIdSelection":[Ljava/lang/String;
    .restart local v11    # "blobsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local v14    # "eventHistory":Landroid/database/Cursor;
    .restart local v22    # "sessionId":Ljava/lang/String;
    :cond_1b2
    if-eqz v14, :cond_1b8

    .line 1516
    :try_start_1b4
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1517
    const/4 v14, 0x0

    .line 1521
    :cond_1b8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "event_history"

    sget-object v4, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_EVENT_HISTORY_SESSION_KEY_REF:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v6}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1522
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1c7
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1ed

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 1524
    .local v8, "blobId":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "upload_blobs"

    sget-object v4, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_UPLOAD_BLOBS_ID:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v24

    aput-object v24, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1c7

    .line 1529
    .end local v8    # "blobId":J
    :cond_1ed
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v3, "sessions"

    sget-object v4, Lcom/localytics/android/SessionHandler;->SELECTION_OPEN_DELETE_EMPTIES_SESSIONS_ID:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v6}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1f8
    .catchall {:try_start_1b4 .. :try_end_1f8} :catchall_1a1

    .line 1534
    .end local v11    # "blobsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v14    # "eventHistory":Landroid/database/Cursor;
    :cond_1f8
    if-eqz v15, :cond_1fe

    .line 1536
    :try_start_1fa
    invoke-interface {v15}, Landroid/database/Cursor;->close()V
    :try_end_1fd
    .catchall {:try_start_1fa .. :try_end_1fd} :catchall_1a9

    .line 1537
    const/4 v15, 0x0

    .line 1544
    .end local v6    # "sessionIdSelection":[Ljava/lang/String;
    .end local v22    # "sessionId":Ljava/lang/String;
    :cond_1fe
    if-eqz v23, :cond_205

    .line 1546
    invoke-interface/range {v23 .. v23}, Landroid/database/Cursor;->close()V

    .line 1547
    const/16 v23, 0x0

    .line 1554
    :cond_205
    if-nez p1, :cond_222

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v2}, Lcom/localytics/android/SessionHandler;->getNumberOfSessions(Lcom/localytics/android/LocalyticsProvider;)J

    move-result-wide v2

    const-wide/16 v4, 0xa

    cmp-long v2, v2, v4

    if-ltz v2, :cond_222

    .line 1556
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_15

    .line 1558
    const-string v2, "Localytics"

    const-string v3, "Maximum number of sessions are already on disk--not writing any new sessions until old sessions are cleared out.  Try calling upload() to store more sessions."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_15

    .line 1563
    :cond_222
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_22d

    .line 1565
    const-string v2, "Localytics"

    const-string v3, "Opening new session"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1568
    :cond_22d
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/localytics/android/SessionHandler;->openNewSession(Ljava/util/Map;)V

    goto/16 :goto_15

    .line 1406
    :pswitch_data_236
    .packed-switch 0x1
        :pswitch_98
        :pswitch_80
    .end packed-switch
.end method

.method optOut(Z)V
    .registers 11
    .param p1, "isOptingOut"    # Z

    .prologue
    const/4 v8, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1166
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_1a

    .line 1168
    const-string v1, "Localytics"

    const-string v2, "Requested opt-out state is %b"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1172
    :cond_1a
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/localytics/android/SessionHandler;->isOptedOut(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Z

    move-result v1

    if-ne v1, p1, :cond_25

    .line 1195
    :goto_24
    return-void

    .line 1177
    :cond_25
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v1}, Lcom/localytics/android/SessionHandler;->getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_5f

    .line 1182
    invoke-virtual {p0, v6, v5}, Lcom/localytics/android/SessionHandler;->open(ZLjava/util/Map;)V

    .line 1183
    if-eqz p1, :cond_5c

    sget-object v1, Lcom/localytics/android/Constants;->OPT_OUT_EVENT:Ljava/lang/String;

    :goto_34
    invoke-virtual {p0, v1, v5}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 1184
    invoke-virtual {p0, v5}, Lcom/localytics/android/SessionHandler;->close(Ljava/util/Map;)V

    .line 1191
    :goto_3a
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1192
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "opt_out"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1193
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v2, "api_keys"

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_OPT_IN_OUT:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/String;

    iget-wide v6, p0, Lcom/localytics/android/SessionHandler;->mApiKeyId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_24

    .line 1183
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_5c
    sget-object v1, Lcom/localytics/android/Constants;->OPT_IN_EVENT:Ljava/lang/String;

    goto :goto_34

    .line 1188
    :cond_5f
    if-eqz p1, :cond_67

    sget-object v1, Lcom/localytics/android/Constants;->OPT_OUT_EVENT:Ljava/lang/String;

    :goto_63
    invoke-virtual {p0, v1, v5}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_3a

    :cond_67
    sget-object v1, Lcom/localytics/android/Constants;->OPT_IN_EVENT:Ljava/lang/String;

    goto :goto_63
.end method

.method setCustomDimension(ILjava/lang/String;)V
    .registers 6
    .param p1, "dimension"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 2294
    if-ltz p1, :cond_6

    const/16 v1, 0x9

    if-le p1, v1, :cond_12

    .line 2296
    :cond_6
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_11

    .line 2298
    const-string v1, "Localytics"

    const-string v2, "Only valid dimensions are 0 - 9"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2351
    :cond_11
    :goto_11
    return-void

    .line 2303
    :cond_12
    sget-object v1, Lcom/localytics/android/SessionHandler;->CUSTOM_DIMENSION_KEYS:[Ljava/lang/String;

    aget-object v0, v1, p1

    .line 2305
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    new-instance v2, Lcom/localytics/android/SessionHandler$16;

    invoke-direct {v2, p0, v0, p2}, Lcom/localytics/android/SessionHandler$16;-><init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_11
.end method

.method setIdentifier(Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 2224
    const/4 v7, 0x0

    .line 2227
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_1
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "identifiers"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_SET_IDENTIFIER:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_SET_IDENTIFIER:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 2229
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 2231
    if-nez p2, :cond_48

    .line 2233
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "identifiers"

    const-string v2, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "key"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "key"

    invoke-interface {v7, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_1 .. :try_end_41} :catchall_77

    .line 2261
    :cond_41
    :goto_41
    if-eqz v7, :cond_47

    .line 2263
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2264
    const/4 v7, 0x0

    .line 2267
    :cond_47
    return-void

    .line 2237
    :cond_48
    :try_start_48
    const-string v0, "value"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 2238
    .local v6, "currentValue":Ljava/lang/String;
    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_41

    .line 2240
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 2241
    .local v8, "values":Landroid/content/ContentValues;
    const-string v0, "key"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2242
    const-string v0, "value"

    invoke-virtual {v8, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2243
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "identifiers"

    sget-object v2, Lcom/localytics/android/SessionHandler;->SELECTION_SET_IDENTIFIER:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v8, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_76
    .catchall {:try_start_48 .. :try_end_76} :catchall_77

    goto :goto_41

    .line 2261
    .end local v6    # "currentValue":Ljava/lang/String;
    .end local v8    # "values":Landroid/content/ContentValues;
    :catchall_77
    move-exception v0

    if-eqz v7, :cond_7e

    .line 2263
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2264
    const/4 v7, 0x0

    :cond_7e
    throw v0

    .line 2249
    :cond_7f
    if-eqz p2, :cond_41

    .line 2251
    :try_start_81
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 2252
    .restart local v8    # "values":Landroid/content/ContentValues;
    const-string v0, "key"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2253
    const-string v0, "value"

    invoke-virtual {v8, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2254
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "identifiers"

    invoke-virtual {v0, v1, v8}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_97
    .catchall {:try_start_81 .. :try_end_97} :catchall_77

    goto :goto_41
.end method

.method setPushDisabled(I)V
    .registers 6
    .param p1, "disabled"    # I

    .prologue
    const/4 v3, 0x0

    .line 2424
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2425
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "push_disabled"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2426
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v3, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2427
    return-void
.end method

.method setPushRegistrationId(Ljava/lang/String;)V
    .registers 6
    .param p1, "pushRegId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 2393
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2394
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "registration_id"

    if-nez p1, :cond_c

    const-string p1, ""

    .end local p1    # "pushRegId":Ljava/lang/String;
    :cond_c
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2395
    const-string v1, "registration_version"

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2396
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v2, "info"

    invoke-virtual {v1, v2, v0, v3, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2397
    return-void
.end method

.method tagEvent(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .param p1, "event"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1931
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    .line 1932
    return-void
.end method

.method tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V
    .registers 33
    .param p1, "event"    # Ljava/lang/String;
    .param p3, "clv"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Long;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1950
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v4}, Lcom/localytics/android/SessionHandler;->getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;

    move-result-object v24

    .line 1951
    .local v24, "openSessionId":Ljava/lang/Long;
    if-nez v24, :cond_16

    .line 1953
    sget-boolean v4, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v4, :cond_15

    .line 1955
    const-string v4, "Localytics"

    const-string v5, "Event not written because a session is not open"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2122
    :cond_15
    :goto_15
    return-void

    .line 1965
    :cond_16
    new-instance v27, Landroid/content/ContentValues;

    invoke-direct/range {v27 .. v27}, Landroid/content/ContentValues;-><init>()V

    .line 1966
    .local v27, "values":Landroid/content/ContentValues;
    const-string v4, "session_key_ref"

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1967
    const-string v4, "uuid"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1968
    const-string v4, "event_name"

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1969
    const-string v4, "real_time"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1970
    const-string v4, "wall_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1972
    if-eqz p3, :cond_12b

    .line 1974
    const-string v4, "clv_increase"

    move-object/from16 v0, v27

    move-object/from16 v1, p3

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1981
    :goto_65
    sget-object v4, Lcom/localytics/android/SessionHandler;->sLastLocation:Landroid/location/Location;

    if-eqz v4, :cond_8b

    .line 1983
    const-string v4, "event_lat"

    sget-object v5, Lcom/localytics/android/SessionHandler;->sLastLocation:Landroid/location/Location;

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 1984
    const-string v4, "event_lng"

    sget-object v5, Lcom/localytics/android/SessionHandler;->sLastLocation:Landroid/location/Location;

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 1990
    :cond_8b
    sget-object v4, Lcom/localytics/android/Constants;->OPEN_EVENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d0

    .line 1992
    const/4 v12, 0x0

    .line 1995
    .local v12, "cursor":Landroid/database/Cursor;
    :try_start_96
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v5, "sessions"

    sget-object v6, Lcom/localytics/android/SessionHandler;->PROJECTION_TAG_EVENT:[Ljava/lang/String;

    sget-object v7, Lcom/localytics/android/SessionHandler;->SELECTION_TAG_EVENT:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v8, v9

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 1998
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_139

    .line 2000
    const-string v4, "wall_time"

    const-string v5, "session_start_wall_time"

    invoke-interface {v12, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v12, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V
    :try_end_ca
    .catchall {:try_start_96 .. :try_end_ca} :catchall_141

    .line 2010
    if-eqz v12, :cond_d0

    .line 2012
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 2013
    const/4 v12, 0x0

    .line 2018
    .end local v12    # "cursor":Landroid/database/Cursor;
    :cond_d0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-virtual {v4}, Lcom/localytics/android/LocalyticsProvider;->getUserIdAndType()Ljava/util/Map;

    move-result-object v20

    .line 2019
    .local v20, "id":Ljava/util/Map;
    const-string v4, "id"

    move-object/from16 v0, v20

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 2020
    .local v13, "customerID":Ljava/lang/String;
    const-string v4, "type"

    move-object/from16 v0, v20

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 2021
    .local v25, "userType":Ljava/lang/String;
    const-string v4, "customer_id"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2022
    const-string v4, "user_type"

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2025
    :try_start_fc
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v4}, Lcom/localytics/android/UploadHandler;->getIdentifiers(Lcom/localytics/android/LocalyticsProvider;)Lorg/json/JSONObject;

    move-result-object v22

    .line 2026
    .local v22, "identifiers":Lorg/json/JSONObject;
    if-eqz v22, :cond_111

    .line 2028
    const-string v4, "ids"

    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_111
    .catch Lorg/json/JSONException; {:try_start_fc .. :try_end_111} :catch_149

    .line 2038
    .end local v22    # "identifiers":Lorg/json/JSONObject;
    :cond_111
    :goto_111
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v5, "events"

    move-object/from16 v0, v27

    invoke-virtual {v4, v5, v0}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v16

    .line 2040
    .local v16, "eventId":J
    const-wide/16 v4, -0x1

    cmp-long v4, v4, v16

    if-nez v4, :cond_156

    .line 2042
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Inserting event failed"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1978
    .end local v13    # "customerID":Ljava/lang/String;
    .end local v16    # "eventId":J
    .end local v20    # "id":Ljava/util/Map;
    .end local v25    # "userType":Ljava/lang/String;
    :cond_12b
    const-string v4, "clv_increase"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_65

    .line 2005
    .restart local v12    # "cursor":Landroid/database/Cursor;
    :cond_139
    :try_start_139
    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "During tag of open event, session didn\'t exist"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4
    :try_end_141
    .catchall {:try_start_139 .. :try_end_141} :catchall_141

    .line 2010
    :catchall_141
    move-exception v4

    if-eqz v12, :cond_148

    .line 2012
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 2013
    const/4 v12, 0x0

    :cond_148
    throw v4

    .line 2031
    .end local v12    # "cursor":Landroid/database/Cursor;
    .restart local v13    # "customerID":Ljava/lang/String;
    .restart local v20    # "id":Ljava/util/Map;
    .restart local v25    # "userType":Ljava/lang/String;
    :catch_149
    move-exception v14

    .line 2033
    .local v14, "e":Lorg/json/JSONException;
    sget-boolean v4, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v4, :cond_111

    .line 2035
    const-string v4, "Localytics"

    const-string v5, "Caught exception"

    invoke-static {v4, v5, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_111

    .line 2049
    .end local v14    # "e":Lorg/json/JSONException;
    .restart local v16    # "eventId":J
    :cond_156
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_158
    const/16 v4, 0xa

    move/from16 v0, v18

    if-ge v0, v4, :cond_189

    .line 2051
    sget-object v4, Lcom/localytics/android/SessionHandler;->CUSTOM_DIMENSION_KEYS:[Ljava/lang/String;

    aget-object v23, v4, v18

    .line 2052
    .local v23, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->getCustomDimension(I)Ljava/lang/String;

    move-result-object v26

    .line 2053
    .local v26, "value":Ljava/lang/String;
    if-eqz v26, :cond_186

    .line 2055
    if-nez p2, :cond_173

    .line 2057
    new-instance p2, Ljava/util/TreeMap;

    .end local p2    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct/range {p2 .. p2}, Ljava/util/TreeMap;-><init>()V

    .line 2061
    .restart local p2    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_173
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_186

    .line 2063
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2049
    :cond_186
    add-int/lit8 v18, v18, 0x1

    goto :goto_158

    .line 2071
    .end local v23    # "key":Ljava/lang/String;
    .end local v26    # "value":Ljava/lang/String;
    :cond_189
    if-eqz p2, :cond_213

    .line 2074
    new-instance v27, Landroid/content/ContentValues;

    .end local v27    # "values":Landroid/content/ContentValues;
    invoke-direct/range {v27 .. v27}, Landroid/content/ContentValues;-><init>()V

    .line 2076
    .restart local v27    # "values":Landroid/content/ContentValues;
    const-string v4, "%s:%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, ""

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 2077
    .local v11, "applicationAttributePrefix":Ljava/lang/String;
    const/4 v10, 0x0

    .line 2079
    .local v10, "applicationAttributeCount":I
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .end local v20    # "id":Ljava/util/Map;
    .local v19, "i$":Ljava/util/Iterator;
    :cond_1b2
    :goto_1b2
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_213

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Map$Entry;

    .line 2084
    .local v15, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1d0

    .line 2086
    add-int/lit8 v10, v10, 0x1

    .line 2087
    const/16 v4, 0x32

    if-gt v10, v4, :cond_1b2

    .line 2093
    :cond_1d0
    const-string v4, "events_key_ref"

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2094
    const-string v5, "attribute_key"

    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, v27

    invoke-virtual {v0, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2095
    const-string v5, "attribute_value"

    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, v27

    invoke-virtual {v0, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2097
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v5, "attributes"

    move-object/from16 v0, v27

    invoke-virtual {v4, v5, v0}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2099
    .local v20, "id":J
    const-wide/16 v4, -0x1

    cmp-long v4, v4, v20

    if-nez v4, :cond_20f

    .line 2101
    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "Inserting attribute failed"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 2104
    :cond_20f
    invoke-virtual/range {v27 .. v27}, Landroid/content/ContentValues;->clear()V

    goto :goto_1b2

    .line 2111
    .end local v10    # "applicationAttributeCount":I
    .end local v11    # "applicationAttributePrefix":Ljava/lang/String;
    .end local v15    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v19    # "i$":Ljava/util/Iterator;
    .end local v20    # "id":J
    :cond_213
    sget-object v4, Lcom/localytics/android/Constants;->OPEN_EVENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    sget-object v4, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    sget-object v4, Lcom/localytics/android/Constants;->OPT_IN_EVENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    sget-object v4, Lcom/localytics/android/Constants;->OPT_OUT_EVENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    sget-object v4, Lcom/localytics/android/Constants;->FLOW_EVENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 2113
    new-instance v27, Landroid/content/ContentValues;

    .end local v27    # "values":Landroid/content/ContentValues;
    invoke-direct/range {v27 .. v27}, Landroid/content/ContentValues;-><init>()V

    .line 2114
    .restart local v27    # "values":Landroid/content/ContentValues;
    const-string v4, "name"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2115
    const-string v4, "type"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2116
    const-string v4, "session_key_ref"

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2117
    const-string v4, "processed_in_blob"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 2118
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v5, "event_history"

    move-object/from16 v0, v27

    invoke-virtual {v4, v5, v0}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 2120
    invoke-direct/range {p0 .. p0}, Lcom/localytics/android/SessionHandler;->conditionallyAddFlowEvent()V

    goto/16 :goto_15
.end method

.method tagScreen(Ljava/lang/String;)V
    .registers 13
    .param p1, "screen"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    .line 2157
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v0}, Lcom/localytics/android/SessionHandler;->getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;

    move-result-object v7

    .line 2158
    .local v7, "openSessionId":Ljava/lang/Long;
    if-nez v7, :cond_15

    .line 2160
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_14

    .line 2162
    const-string v0, "Localytics"

    const-string v1, "Tag not written because the session was not open"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2210
    :cond_14
    :goto_14
    return-void

    .line 2170
    :cond_15
    const/4 v6, 0x0

    .line 2173
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_16
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "event_history"

    sget-object v2, Lcom/localytics/android/SessionHandler;->PROJECTION_TAG_SCREEN:[Ljava/lang/String;

    sget-object v3, Lcom/localytics/android/SessionHandler;->SELECTION_TAG_SCREEN:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v5

    sget-object v5, Lcom/localytics/android/SessionHandler;->SORT_ORDER_TAG_SCREEN:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2178
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_68

    .line 2180
    const-string v0, "name"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    .line 2182
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_61

    .line 2184
    const-string v0, "Localytics"

    const-string v1, "Suppressed duplicate screen %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_61
    .catchall {:try_start_16 .. :try_end_61} :catchall_97

    .line 2192
    :cond_61
    if-eqz v6, :cond_14

    .line 2194
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2195
    const/4 v6, 0x0

    goto :goto_14

    .line 2192
    :cond_68
    if-eqz v6, :cond_6e

    .line 2194
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2195
    const/4 v6, 0x0

    .line 2202
    :cond_6e
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 2203
    .local v8, "values":Landroid/content/ContentValues;
    const-string v0, "name"

    invoke-virtual {v8, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2204
    const-string v0, "type"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2205
    const-string v0, "session_key_ref"

    invoke-virtual {v8, v0, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2206
    const-string v0, "processed_in_blob"

    invoke-virtual {v8, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 2207
    iget-object v0, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "event_history"

    invoke-virtual {v0, v1, v8}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 2209
    invoke-direct {p0}, Lcom/localytics/android/SessionHandler;->conditionallyAddFlowEvent()V

    goto/16 :goto_14

    .line 2192
    .end local v8    # "values":Landroid/content/ContentValues;
    :catchall_97
    move-exception v0

    if-eqz v6, :cond_9e

    .line 2194
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2195
    const/4 v6, 0x0

    :cond_9e
    throw v0
.end method

.method upload(Ljava/lang/Runnable;)V
    .registers 6
    .param p1, "callback"    # Ljava/lang/Runnable;

    .prologue
    .line 2646
    sget-object v1, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 2648
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_1b

    .line 2650
    const-string v1, "Localytics"

    const-string v2, "Already uploading"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2653
    :cond_1b
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mUploadHandler:Lcom/localytics/android/UploadHandler;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mUploadHandler:Lcom/localytics/android/UploadHandler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3, p1}, Lcom/localytics/android/UploadHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/UploadHandler;->sendMessage(Landroid/os/Message;)Z

    .line 2683
    :cond_27
    :goto_27
    return-void

    .line 2659
    :cond_28
    :try_start_28
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v1}, Lcom/localytics/android/SessionHandler;->preUploadBuildBlobs(Lcom/localytics/android/LocalyticsProvider;)V

    .line 2661
    sget-object v1, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2662
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mUploadHandler:Lcom/localytics/android/UploadHandler;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mUploadHandler:Lcom/localytics/android/UploadHandler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p1}, Lcom/localytics/android/UploadHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/UploadHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_42} :catch_43

    goto :goto_27

    .line 2664
    :catch_43
    move-exception v0

    .line 2666
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_4f

    .line 2668
    const-string v1, "Localytics"

    const-string v2, "Error occurred during upload"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2671
    :cond_4f
    sget-object v1, Lcom/localytics/android/SessionHandler;->sIsUploadingMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2674
    if-eqz p1, :cond_27

    .line 2680
    new-instance v1, Ljava/lang/Thread;

    const-string v2, "upload_callback"

    invoke-direct {v1, p1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_27
.end method

.method uploadProfile(Ljava/lang/Runnable;)V
    .registers 6
    .param p1, "callback"    # Ljava/lang/Runnable;

    .prologue
    .line 2699
    sget-object v1, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 2701
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_1b

    .line 2703
    const-string v1, "Localytics"

    const-string v2, "Already uploading profile"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2706
    :cond_1b
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProfileUploadHandler:Lcom/localytics/android/UploadHandler;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mProfileUploadHandler:Lcom/localytics/android/UploadHandler;

    const/4 v3, 0x4

    invoke-virtual {v2, v3, p1}, Lcom/localytics/android/UploadHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/UploadHandler;->sendMessage(Landroid/os/Message;)Z

    .line 2734
    :cond_27
    :goto_27
    return-void

    .line 2712
    :cond_28
    :try_start_28
    sget-object v1, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2713
    iget-object v1, p0, Lcom/localytics/android/SessionHandler;->mProfileUploadHandler:Lcom/localytics/android/UploadHandler;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mProfileUploadHandler:Lcom/localytics/android/UploadHandler;

    const/4 v3, 0x3

    invoke-virtual {v2, v3, p1}, Lcom/localytics/android/UploadHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/UploadHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_3d} :catch_3e

    goto :goto_27

    .line 2715
    :catch_3e
    move-exception v0

    .line 2717
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_4a

    .line 2719
    const-string v1, "Localytics"

    const-string v2, "Error occurred during profile upload"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2722
    :cond_4a
    sget-object v1, Lcom/localytics/android/SessionHandler;->sIsUploadingProfileMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler;->mApiKey:Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2725
    if-eqz p1, :cond_27

    .line 2731
    new-instance v1, Ljava/lang/Thread;

    const-string v2, "upload_profile_callback"

    invoke-direct {v1, p1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_27
.end method
