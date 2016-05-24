.class Lcom/localytics/android/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field public static ANALYTICS_URL:Ljava/lang/String;

.field static final CLOSE_EVENT:Ljava/lang/String;

.field static final CURRENT_API_LEVEL:I

.field static final FLOW_EVENT:Ljava/lang/String;

.field public static IS_LOGGABLE:Z

.field static final OPEN_EVENT:Ljava/lang/String;

.field static final OPT_IN_EVENT:Ljava/lang/String;

.field static final OPT_OUT_EVENT:Ljava/lang/String;

.field public static PROFILES_URL:Ljava/lang/String;

.field public static SESSION_EXPIRATION:J

.field public static USE_HTTPS:Z


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 103
    const-wide/16 v0, 0x3a98

    sput-wide v0, Lcom/localytics/android/Constants;->SESSION_EXPIRATION:J

    .line 116
    sput-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    .line 121
    sput-boolean v4, Lcom/localytics/android/Constants;->USE_HTTPS:Z

    .line 147
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v0

    sput v0, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    .line 152
    const-string v0, "analytics.localytics.com"

    sput-object v0, Lcom/localytics/android/Constants;->ANALYTICS_URL:Ljava/lang/String;

    .line 157
    const-string v0, "profile.localytics.com"

    sput-object v0, Lcom/localytics/android/Constants;->PROFILES_URL:Ljava/lang/String;

    .line 177
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "open"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/Constants;->OPEN_EVENT:Ljava/lang/String;

    .line 182
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "close"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    .line 187
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "opt_in"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/Constants;->OPT_IN_EVENT:Ljava/lang/String;

    .line 192
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "opt_out"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/Constants;->OPT_OUT_EVENT:Ljava/lang/String;

    .line 197
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "flow"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/Constants;->FLOW_EVENT:Ljava/lang/String;

    return-void
.end method
