.class public final Lcom/adobe/creativesdk/aviary/log/LoggerFactory;
.super Ljava/lang/Object;
.source "LoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/log/LoggerFactory$ConsoleLogger;,
        Lcom/adobe/creativesdk/aviary/log/LoggerFactory$NullLogger;,
        Lcom/adobe/creativesdk/aviary/log/LoggerFactory$BaseLogger;,
        Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;,
        Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 2
    .param p0, "basetag"    # Ljava/lang/String;

    .prologue
    .line 176
    sget-object v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {p0, v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 3
    .param p0, "basetag"    # Ljava/lang/String;
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    .prologue
    .line 169
    sget-object v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    if-ne p1, v0, :cond_a

    .line 170
    new-instance v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$ConsoleLogger;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$ConsoleLogger;-><init>(Ljava/lang/String;)V

    .line 172
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$NullLogger;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$NullLogger;-><init>(Ljava/lang/String;)V

    goto :goto_9
.end method

.method public static printDeveloperError(Ljava/lang/String;)V
    .registers 4
    .param p0, "error"    # Ljava/lang/String;

    .prologue
    .line 185
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 186
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const-string v1, " \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    const-string v1, "==================================================\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 188
    const-string v1, "==================================================\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 189
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 190
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 191
    const-string v1, "==================================================\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    const-string v1, "==================================================\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    const-string v1, "Aviary-SDK"

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    return-void
.end method
