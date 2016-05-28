.class public final Lcom/nostra13/universalimageloader/utils/L;
.super Ljava/lang/Object;
.source "L.java"


# static fields
.field private static volatile writeDebugLogs:Z

.field private static volatile writeLogs:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-boolean v0, Lcom/nostra13/universalimageloader/utils/L;->writeDebugLogs:Z

    .line 31
    const/4 v0, 0x1

    sput-boolean v0, Lcom/nostra13/universalimageloader/utils/L;->writeLogs:Z

    return-void
.end method

.method public static varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 72
    sget-boolean v0, Lcom/nostra13/universalimageloader/utils/L;->writeDebugLogs:Z

    if-eqz v0, :cond_9

    .line 73
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1}, Lcom/nostra13/universalimageloader/utils/L;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    :cond_9
    return-void
.end method

.method public static varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 90
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1}, Lcom/nostra13/universalimageloader/utils/L;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public static e(Ljava/lang/Throwable;)V
    .registers 4
    .param p0, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 86
    const/4 v0, 0x6

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, p0, v1, v2}, Lcom/nostra13/universalimageloader/utils/L;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 87
    return-void
.end method

.method public static varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 78
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1}, Lcom/nostra13/universalimageloader/utils/L;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 79
    return-void
.end method

.method private static varargs log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 10
    .param p0, "priority"    # I
    .param p1, "ex"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 98
    sget-boolean v3, Lcom/nostra13/universalimageloader/utils/L;->writeLogs:Z

    if-nez v3, :cond_5

    .line 112
    :goto_4
    return-void

    .line 99
    :cond_5
    array-length v3, p3

    if-lez v3, :cond_c

    .line 100
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 104
    :cond_c
    if-nez p1, :cond_15

    .line 105
    move-object v0, p2

    .line 111
    .local v0, "log":Ljava/lang/String;
    :goto_f
    sget-object v3, Lcom/nostra13/universalimageloader/core/ImageLoader;->TAG:Ljava/lang/String;

    invoke-static {p0, v3, v0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 107
    .end local v0    # "log":Ljava/lang/String;
    :cond_15
    if-nez p2, :cond_2f

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "logMessage":Ljava/lang/String;
    :goto_1b
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "logBody":Ljava/lang/String;
    const-string v3, "%1$s\n%2$s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "log":Ljava/lang/String;
    goto :goto_f

    .end local v0    # "log":Ljava/lang/String;
    .end local v1    # "logBody":Ljava/lang/String;
    .end local v2    # "logMessage":Ljava/lang/String;
    :cond_2f
    move-object v2, p2

    .line 107
    goto :goto_1b
.end method

.method public static varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 82
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-static {v0, v1, p0, p1}, Lcom/nostra13/universalimageloader/utils/L;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public static writeDebugLogs(Z)V
    .registers 1
    .param p0, "writeDebugLogs"    # Z

    .prologue
    .line 63
    sput-boolean p0, Lcom/nostra13/universalimageloader/utils/L;->writeDebugLogs:Z

    .line 64
    return-void
.end method
