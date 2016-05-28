.class public Lcom/behance/sdk/logger/Logger;
.super Ljava/lang/Object;
.source "Logger.java"

# interfaces
.implements Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private DEBUG:Z

.field private ERROR:Z

.field private INFO:Z

.field private LOG_LEVEL:I

.field private WARN:Z

.field private WTF:Z

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 6
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput v3, p0, Lcom/behance/sdk/logger/Logger;->LOG_LEVEL:I

    .line 33
    iget v0, p0, Lcom/behance/sdk/logger/Logger;->LOG_LEVEL:I

    if-lez v0, :cond_33

    move v0, v1

    :goto_d
    iput-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->WTF:Z

    .line 34
    iget v0, p0, Lcom/behance/sdk/logger/Logger;->LOG_LEVEL:I

    if-le v0, v1, :cond_35

    move v0, v1

    :goto_14
    iput-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->ERROR:Z

    .line 35
    iget v0, p0, Lcom/behance/sdk/logger/Logger;->LOG_LEVEL:I

    if-le v0, v3, :cond_37

    move v0, v1

    :goto_1b
    iput-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->WARN:Z

    .line 36
    iget v0, p0, Lcom/behance/sdk/logger/Logger;->LOG_LEVEL:I

    const/4 v3, 0x3

    if-le v0, v3, :cond_39

    move v0, v1

    :goto_23
    iput-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->INFO:Z

    .line 37
    iget v0, p0, Lcom/behance/sdk/logger/Logger;->LOG_LEVEL:I

    const/4 v3, 0x4

    if-le v0, v3, :cond_3b

    :goto_2a
    iput-boolean v1, p0, Lcom/behance/sdk/logger/Logger;->DEBUG:Z

    .line 42
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    .line 43
    return-void

    :cond_33
    move v0, v2

    .line 33
    goto :goto_d

    :cond_35
    move v0, v2

    .line 34
    goto :goto_14

    :cond_37
    move v0, v2

    .line 35
    goto :goto_1b

    :cond_39
    move v0, v2

    .line 36
    goto :goto_23

    :cond_3b
    move v1, v2

    .line 37
    goto :goto_2a
.end method

.method private varargs getFormattedMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 152
    :try_start_0
    array-length v1, p2

    if-lez v1, :cond_7

    .line 153
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_8

    move-result-object p1

    .line 159
    .end local p1    # "msg":Ljava/lang/String;
    :cond_7
    :goto_7
    return-object p1

    .line 157
    .restart local p1    # "msg":Ljava/lang/String;
    :catch_8
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lcom/behance/sdk/logger/Logger;->error(Ljava/lang/Throwable;)V

    .line 159
    const-string p1, ""

    goto :goto_7
.end method


# virtual methods
.method public varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->DEBUG:Z

    if-eqz v0, :cond_d

    .line 48
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/logger/Logger;->getFormattedMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :cond_d
    return-void
.end method

.method public debug(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->DEBUG:Z

    if-eqz v0, :cond_d

    .line 55
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 57
    :cond_d
    return-void
.end method

.method public varargs debug(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "tr"    # Ljava/lang/Throwable;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->DEBUG:Z

    if-eqz v0, :cond_d

    .line 62
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lcom/behance/sdk/logger/Logger;->getFormattedMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    :cond_d
    return-void
.end method

.method public varargs error(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->ERROR:Z

    if-eqz v0, :cond_d

    .line 69
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/logger/Logger;->getFormattedMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    :cond_d
    return-void
.end method

.method public error(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->ERROR:Z

    if-eqz v0, :cond_d

    .line 76
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    :cond_d
    return-void
.end method

.method public varargs error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "tr"    # Ljava/lang/Throwable;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->ERROR:Z

    if-eqz v0, :cond_d

    .line 83
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lcom/behance/sdk/logger/Logger;->getFormattedMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 85
    :cond_d
    return-void
.end method

.method public varargs warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 110
    iget-boolean v0, p0, Lcom/behance/sdk/logger/Logger;->WARN:Z

    if-eqz v0, :cond_d

    .line 111
    iget-object v0, p0, Lcom/behance/sdk/logger/Logger;->tag:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/logger/Logger;->getFormattedMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    :cond_d
    return-void
.end method
