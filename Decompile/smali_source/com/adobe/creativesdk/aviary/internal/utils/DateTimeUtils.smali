.class public final Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;
.super Ljava/lang/Object;
.source "DateTimeUtils.java"


# static fields
.field static final GMT_TIME_ZONE:Ljava/util/TimeZone;

.field static final LOCAL_TIME_ZONE:Ljava/util/TimeZone;

.field static final S_SQLDATE_FORMAT:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 25
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->GMT_TIME_ZONE:Ljava/util/TimeZone;

    .line 26
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->LOCAL_TIME_ZONE:Ljava/util/TimeZone;

    .line 27
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->S_SQLDATE_FORMAT:Ljava/text/SimpleDateFormat;

    .line 30
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->S_SQLDATE_FORMAT:Ljava/text/SimpleDateFormat;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 31
    return-void
.end method

.method public static tick()J
    .registers 2

    .prologue
    .line 36
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public static tick(JLjava/lang/String;)J
    .registers 11
    .param p0, "t1"    # J
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 42
    .local v0, "t2":J
    const-string v2, "DateTimeUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", time: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sub-long v4, v0, p0

    long-to-double v4, v4

    const-wide v6, 0x412e848000000000L

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    return-wide v0
.end method

.method public static toSqlDateTime(J)Ljava/lang/String;
    .registers 4
    .param p0, "time"    # J

    .prologue
    .line 54
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toSqlDateTime(Ljava/util/Date;)Ljava/lang/String;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 58
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->S_SQLDATE_FORMAT:Ljava/text/SimpleDateFormat;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->GMT_TIME_ZONE:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 59
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->S_SQLDATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
