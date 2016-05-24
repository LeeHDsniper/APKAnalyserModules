.class public final Lorg/apache/http/impl/cookie/DateUtils;
.super Ljava/lang/Object;
.source "DateUtils.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final GMT:Ljava/util/TimeZone;

.field public static final PATTERN_ASCTIME:Ljava/lang/String; = "EEE MMM d HH:mm:ss yyyy"

.field public static final PATTERN_RFC1036:Ljava/lang/String; = "EEE, dd-MMM-yy HH:mm:ss zzz"

.field public static final PATTERN_RFC1123:Ljava/lang/String; = "EEE, dd MMM yyyy HH:mm:ss zzz"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 65
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/cookie/DateUtils;->GMT:Ljava/util/TimeZone;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    return-void
.end method

.method public static formatDate(Ljava/util/Date;)Ljava/lang/String;
    .registers 2
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 132
    invoke-static {p0}, Lorg/apache/http/client/utils/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDate(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 149
    invoke-static {p0, p1}, Lorg/apache/http/client/utils/DateUtils;->formatDate(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 2
    .param p0, "dateValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/cookie/DateParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 79
    invoke-static {p0, v0, v0}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parseDate(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;
    .registers 3
    .param p0, "dateValue"    # Ljava/lang/String;
    .param p1, "dateFormats"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/cookie/DateParseException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;
    .registers 7
    .param p0, "dateValue"    # Ljava/lang/String;
    .param p1, "dateFormats"    # [Ljava/lang/String;
    .param p2, "startDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/cookie/DateParseException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-static {p0, p1, p2}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    .line 117
    .local v0, "d":Ljava/util/Date;
    if-nez v0, :cond_1f

    .line 118
    new-instance v1, Lorg/apache/http/impl/cookie/DateParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to parse the date "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/impl/cookie/DateParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 120
    :cond_1f
    return-object v0
.end method
