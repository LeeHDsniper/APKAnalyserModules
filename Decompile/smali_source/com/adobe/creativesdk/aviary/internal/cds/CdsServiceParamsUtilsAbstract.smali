.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;
.super Ljava/lang/Object;
.source "CdsServiceParamsUtilsAbstract.java"


# static fields
.field private static mContentGroup:Ljava/lang/String;

.field private static mCountry:Ljava/lang/String;

.field private static mDebug:I

.field private static mLanguage:Ljava/lang/String;

.field private static mLocale:Ljava/util/Locale;

.field private static sInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mDebug:I

    .line 148
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->sInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    return-void
.end method

.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;
    .registers 2

    .prologue
    .line 151
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->sInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method getContentGroup(Landroid/content/Context;)Ljava/lang/String;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 101
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    if-nez v3, :cond_44

    .line 102
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getPreferences(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v1

    .line 103
    .local v1, "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    if-eqz v1, :cond_59

    .line 104
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getCdsContentGroupUpdateTime()J

    move-result-wide v4

    .line 105
    .local v4, "updateTime":J
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getCdsContentGroup()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    .line 107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v4

    const-wide/32 v8, 0x5265c00

    cmp-long v3, v6, v8

    if-lez v3, :cond_44

    .line 108
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    const-wide/high16 v8, 0x4024000000000000L

    mul-double/2addr v6, v8

    double-to-int v2, v6

    .line 109
    .local v2, "rand":I
    add-int/lit8 v3, v2, 0x41

    int-to-char v0, v3

    .line 110
    .local v0, "ch":C
    new-instance v3, Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [C

    const/4 v7, 0x0

    aput-char v0, v6, v7

    invoke-direct {v3, v6}, Ljava/lang/String;-><init>([C)V

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    .line 113
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->setCdsContentGroup(Ljava/lang/String;)V

    .line 114
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v1, v6, v7}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->setCdsContentGroupUpdateTime(J)V

    .line 121
    .end local v0    # "ch":C
    .end local v1    # "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .end local v2    # "rand":I
    .end local v4    # "updateTime":J
    :cond_44
    :goto_44
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    if-eqz v3, :cond_52

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    const-string v6, "[A-J]"

    invoke-virtual {v3, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_56

    .line 122
    :cond_52
    const-string v3, "A"

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    .line 125
    :cond_56
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    return-object v3

    .line 117
    .restart local v1    # "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :cond_59
    const-string v3, "A"

    sput-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mContentGroup:Ljava/lang/String;

    goto :goto_44
.end method

.method getCountry()Ljava/lang/String;
    .registers 3

    .prologue
    .line 85
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mCountry:Ljava/lang/String;

    if-nez v1, :cond_18

    .line 86
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "country":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->CDS_SUPPORTED_COUNTRIES:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 88
    const-string v0, ""

    .line 90
    :cond_16
    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mCountry:Ljava/lang/String;

    .line 92
    .end local v0    # "country":Ljava/lang/String;
    :cond_18
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mCountry:Ljava/lang/String;

    return-object v1
.end method

.method getFormFactor(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "tablet"

    :goto_8
    return-object v0

    :cond_9
    const-string v0, "phone"

    goto :goto_8
.end method

.method getLanguage()Ljava/lang/String;
    .registers 3

    .prologue
    .line 68
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mLanguage:Ljava/lang/String;

    if-nez v1, :cond_18

    .line 69
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "language":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->CDS_SUPPORTED_LANGUAGES:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 71
    const-string v0, ""

    .line 73
    :cond_16
    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mLanguage:Ljava/lang/String;

    .line 75
    .end local v0    # "language":Ljava/lang/String;
    :cond_18
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mLanguage:Ljava/lang/String;

    return-object v1
.end method

.method getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 36
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mLocale:Ljava/util/Locale;

    if-nez v0, :cond_a

    .line 37
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mLocale:Ljava/util/Locale;

    .line 39
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mLocale:Ljava/util/Locale;

    return-object v0
.end method

.method getPreferences(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 96
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v0

    return-object v0
.end method

.method getResolution(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getServerUrl(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->isDebug(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 142
    const-string v0, "http://cds-gateway.aviary.com/v1/gateway"

    .line 144
    :goto_8
    return-object v0

    :cond_9
    const-string v0, "http://cds-gateway.aviary.com/v1/gateway"

    goto :goto_8
.end method

.method hasCountryParam()Z
    .registers 3

    .prologue
    .line 49
    const-string v0, ""

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method hasLanguageParam()Z
    .registers 3

    .prologue
    .line 44
    const-string v0, ""

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method isDebug(Landroid/content/Context;)Z
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 137
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->isDebugInternal(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method isDebugInternal(Landroid/content/Context;)Z
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 129
    sget v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mDebug:I

    if-gez v0, :cond_29

    .line 130
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->getCDSDebug(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2e

    move v0, v1

    :goto_d
    sput v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mDebug:I

    .line 131
    const-string v0, "CdsServiceParamsUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "using cds debug: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mDebug:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :cond_29
    sget v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->mDebug:I

    if-ne v0, v1, :cond_30

    :goto_2d
    return v1

    :cond_2e
    move v0, v2

    .line 130
    goto :goto_d

    :cond_30
    move v1, v2

    .line 133
    goto :goto_2d
.end method
