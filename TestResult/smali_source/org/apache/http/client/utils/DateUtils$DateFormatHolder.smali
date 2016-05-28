.class final Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;
.super Ljava/lang/Object;
.source "DateUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/client/utils/DateUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DateFormatHolder"
.end annotation


# static fields
.field private static final THREADLOCAL_FORMATS:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/text/SimpleDateFormat;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 203
    new-instance v0, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder$1;

    invoke-direct {v0}, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder$1;-><init>()V

    sput-object v0, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->THREADLOCAL_FORMATS:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearThreadLocal()V
    .registers 1

    .prologue
    .line 245
    sget-object v0, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->THREADLOCAL_FORMATS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 246
    return-void
.end method

.method public static formatFor(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    .registers 6
    .param p0, "pattern"    # Ljava/lang/String;

    .prologue
    .line 226
    sget-object v3, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->THREADLOCAL_FORMATS:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/SoftReference;

    .line 227
    .local v2, "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/util/Map<Ljava/lang/String;Ljava/text/SimpleDateFormat;>;>;"
    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 228
    .local v1, "formats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/text/SimpleDateFormat;>;"
    if-nez v1, :cond_1f

    .line 229
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "formats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/text/SimpleDateFormat;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 230
    .restart local v1    # "formats":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/text/SimpleDateFormat;>;"
    sget-object v3, Lorg/apache/http/client/utils/DateUtils$DateFormatHolder;->THREADLOCAL_FORMATS:Ljava/lang/ThreadLocal;

    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 234
    :cond_1f
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    .line 235
    .local v0, "format":Ljava/text/SimpleDateFormat;
    if-nez v0, :cond_3a

    .line 236
    new-instance v0, Ljava/text/SimpleDateFormat;

    .end local v0    # "format":Ljava/text/SimpleDateFormat;
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, p0, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 237
    .restart local v0    # "format":Ljava/text/SimpleDateFormat;
    const-string v3, "GMT"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 238
    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    :cond_3a
    return-object v0
.end method
