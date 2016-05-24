.class public final Lorg/apache/http/client/utils/DateUtils;
.super Ljava/lang/Object;
.source "DateUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final DEFAULT_PATTERNS:[Ljava/lang/String;

.field private static final DEFAULT_TWO_DIGIT_YEAR_START:Ljava/util/Date;

.field public static final GMT:Ljava/util/TimeZone;

.field public static final PATTERN_ASCTIME:Ljava/lang/String; = "EEE MMM d HH:mm:ss yyyy"

.field public static final PATTERN_RFC1036:Ljava/lang/String; = "EEE, dd-MMM-yy HH:mm:ss zzz"

.field public static final PATTERN_RFC1123:Ljava/lang/String; = "EEE, dd MMM yyyy HH:mm:ss zzz"


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const-string v4, "EEE, dd MMM yyyy HH:mm:ss zzz"

    aput-object v4, v1, v2

    const-string v4, "EEE, dd-MMM-yy HH:mm:ss zzz"

    aput-object v4, v1, v3

    const/4 v4, 0x2

    const-string v5, "EEE MMM d HH:mm:ss yyyy"

    aput-object v5, v1, v4

    sput-object v1, Lorg/apache/http/client/utils/DateUtils;->DEFAULT_PATTERNS:[Ljava/lang/String;

    .line 77
    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    sput-object v1, Lorg/apache/http/client/utils/DateUtils;->GMT:Ljava/util/TimeZone;

    .line 80
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 81
    .local v0, "calendar":Ljava/util/Calendar;
    sget-object v1, Lorg/apache/http/client/utils/DateUtils;->GMT:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 82
    const/16 v1, 0x7d0

    move v4, v2

    move v5, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 83
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 84
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    sput-object v1, Lorg/apache/http/client/utils/DateUtils;->DEFAULT_TWO_DIGIT_YEAR_START:Ljava/util/Date;

    .line 85
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    return-void
.end method

.method public static clearThreadLocal()V
    .registers 0

    .prologue
    .line 187
    invoke-static {}, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->clearThreadLocal()V

    .line 188
    return-void
.end method

.method public static formatDate(Ljava/util/Date;)Ljava/lang/String;
    .registers 2
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 158
    const-string v0, "EEE, dd MMM yyyy HH:mm:ss zzz"

    invoke-static {p0, v0}, Lorg/apache/http/client/utils/DateUtils;->formatDate(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDate(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 175
    const-string v1, "Date"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 176
    const-string v1, "Pattern"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 177
    invoke-static {p1}, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->formatFor(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v0

    .line 178
    .local v0, "formatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 2
    .param p0, "dateValue"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 96
    invoke-static {p0, v0, v0}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parseDate(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;
    .registers 3
    .param p0, "dateValue"    # Ljava/lang/String;
    .param p1, "dateFormats"    # [Ljava/lang/String;

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parseDate(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Date;)Ljava/util/Date;
    .registers 15
    .param p0, "dateValue"    # Ljava/lang/String;
    .param p1, "dateFormats"    # [Ljava/lang/String;
    .param p2, "startDate"    # Ljava/util/Date;

    .prologue
    const/4 v11, 0x1

    .line 127
    const-string v10, "Date value"

    invoke-static {p0, v10}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 128
    if-eqz p1, :cond_4c

    move-object v5, p1

    .line 129
    .local v5, "localDateFormats":[Ljava/lang/String;
    :goto_9
    if-eqz p2, :cond_4f

    move-object v6, p2

    .line 130
    .local v6, "localStartDate":Ljava/util/Date;
    :goto_c
    move-object v9, p0

    .line 133
    .local v9, "v":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-le v10, v11, :cond_2d

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2d

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2d

    .line 134
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v9, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 137
    :cond_2d
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_30
    if-ge v3, v4, :cond_55

    aget-object v1, v0, v3

    .line 138
    .local v1, "dateFormat":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->formatFor(Ljava/lang/String;)Ljava/text/SimpleDateFormat;

    move-result-object v2

    .line 139
    .local v2, "dateParser":Ljava/text/SimpleDateFormat;
    invoke-virtual {v2, v6}, Ljava/text/SimpleDateFormat;->set2DigitYearStart(Ljava/util/Date;)V

    .line 140
    new-instance v7, Ljava/text/ParsePosition;

    const/4 v10, 0x0

    invoke-direct {v7, v10}, Ljava/text/ParsePosition;-><init>(I)V

    .line 141
    .local v7, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v2, v9, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v8

    .line 142
    .local v8, "result":Ljava/util/Date;
    invoke-virtual {v7}, Ljava/text/ParsePosition;->getIndex()I

    move-result v10

    if-eqz v10, :cond_52

    .line 146
    .end local v1    # "dateFormat":Ljava/lang/String;
    .end local v2    # "dateParser":Ljava/text/SimpleDateFormat;
    .end local v7    # "pos":Ljava/text/ParsePosition;
    .end local v8    # "result":Ljava/util/Date;
    :goto_4b
    return-object v8

    .line 128
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "localDateFormats":[Ljava/lang/String;
    .end local v6    # "localStartDate":Ljava/util/Date;
    .end local v9    # "v":Ljava/lang/String;
    :cond_4c
    sget-object v5, Lorg/apache/http/client/utils/DateUtils;->DEFAULT_PATTERNS:[Ljava/lang/String;

    goto :goto_9

    .line 129
    .restart local v5    # "localDateFormats":[Ljava/lang/String;
    :cond_4f
    sget-object v6, Lorg/apache/http/client/utils/DateUtils;->DEFAULT_TWO_DIGIT_YEAR_START:Ljava/util/Date;

    goto :goto_c

    .line 137
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "dateFormat":Ljava/lang/String;
    .restart local v2    # "dateParser":Ljava/text/SimpleDateFormat;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v6    # "localStartDate":Ljava/util/Date;
    .restart local v7    # "pos":Ljava/text/ParsePosition;
    .restart local v8    # "result":Ljava/util/Date;
    .restart local v9    # "v":Ljava/lang/String;
    :cond_52
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 146
    .end local v1    # "dateFormat":Ljava/lang/String;
    .end local v2    # "dateParser":Ljava/text/SimpleDateFormat;
    .end local v7    # "pos":Ljava/text/ParsePosition;
    .end local v8    # "result":Ljava/util/Date;
    :cond_55
    const/4 v8, 0x0

    goto :goto_4b
.end method
