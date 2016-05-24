.class public Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;
.super Ljava/lang/Object;
.source "AdobeLogger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger$1;
    }
.end annotation


# static fields
.field private static consoleLoggingEnabled:Z

.field private static fileLoggingEnabled:Z

.field private static pr:Ljava/io/PrintWriter;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 33
    sput-boolean v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->fileLoggingEnabled:Z

    .line 34
    sput-boolean v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->consoleLoggingEnabled:Z

    .line 38
    sget-boolean v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->fileLoggingEnabled:Z

    if-eqz v2, :cond_29

    .line 39
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "log.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 41
    .local v1, "logFile":Ljava/io/File;
    :try_start_1c
    new-instance v2, Ljava/io/PrintWriter;

    new-instance v3, Ljava/io/FileWriter;

    invoke-direct {v3, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->pr:Ljava/io/PrintWriter;
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_29} :catch_2a

    .line 46
    :cond_29
    :goto_29
    return-void

    .line 42
    :catch_2a
    move-exception v0

    .line 43
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_29
.end method

.method private static convertToAndroidLogLevel(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;)I
    .registers 4
    .param p0, "level"    # Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    .prologue
    .line 126
    const/4 v0, 0x3

    .line 127
    .local v0, "logLevel":I
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$utils$logging$Level:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_16

    .line 142
    :goto_c
    return v0

    .line 129
    :pswitch_d
    const/4 v0, 0x3

    .line 130
    goto :goto_c

    .line 132
    :pswitch_f
    const/4 v0, 0x4

    .line 133
    goto :goto_c

    .line 135
    :pswitch_11
    const/4 v0, 0x5

    .line 136
    goto :goto_c

    .line 138
    :pswitch_13
    const/4 v0, 0x6

    goto :goto_c

    .line 127
    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_d
        :pswitch_f
        :pswitch_13
        :pswitch_11
    .end packed-switch
.end method

.method private static debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 121
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->writeToFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 123
    return-void
.end method

.method private static error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 111
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->writeToFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    return-void
.end method

.method private static info(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 116
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->writeToFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    return-void
.end method

.method public static log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "level"    # Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 49
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->consoleLoggingEnabled:Z

    if-eqz v0, :cond_a

    .line 51
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Exception;

    invoke-static {p0, p1, p2, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    :cond_a
    return-void
.end method

.method public static log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 8
    .param p0, "level"    # Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 146
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->convertToAndroidLogLevel(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;)I

    move-result v1

    .line 149
    .local v1, "logLevel":I
    :try_start_4
    invoke-static {p1, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 151
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$utils$logging$Level:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_50

    .line 172
    :cond_15
    :goto_15
    return-void

    .line 153
    :pswitch_16
    const/4 v2, 0x0

    invoke-static {p1, p2, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 154
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_22} :catch_23

    goto :goto_15

    .line 169
    :catch_23
    move-exception v0

    .line 170
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_15

    .line 157
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_28
    const/4 v2, 0x0

    :try_start_29
    invoke-static {p1, p2, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->info(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 158
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->info(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_15

    .line 161
    :pswitch_35
    const/4 v2, 0x0

    invoke-static {p1, p2, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 162
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_15

    .line 165
    :pswitch_42
    const/4 v2, 0x0

    invoke-static {p1, p2, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->warn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->warn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_4e} :catch_23

    goto :goto_15

    .line 151
    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_16
        :pswitch_28
        :pswitch_35
        :pswitch_42
    .end packed-switch
.end method

.method public static log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 8
    .param p0, "level"    # Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const/16 v3, 0x17

    .line 65
    sget-boolean v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->consoleLoggingEnabled:Z

    if-nez v2, :cond_7

    .line 94
    :cond_6
    :goto_6
    return-void

    .line 70
    :cond_7
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->convertToAndroidLogLevel(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;)I

    move-result v1

    .line 73
    .local v1, "logLevel":I
    :try_start_b
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v2, v3, :cond_38

    .line 76
    :goto_1d
    invoke-static {p1, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 77
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$utils$logging$Level:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_4c

    goto :goto_6

    .line 79
    :pswitch_2f
    invoke-static {p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_32} :catch_33

    goto :goto_6

    .line 91
    :catch_33
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    .line 74
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_38
    const/4 v2, 0x0

    const/16 v3, 0x17

    :try_start_3b
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_1d

    .line 82
    :pswitch_40
    invoke-static {p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->info(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 85
    :pswitch_44
    invoke-static {p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 88
    :pswitch_48
    invoke-static {p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->warn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_4b} :catch_33

    goto :goto_6

    .line 77
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_40
        :pswitch_44
        :pswitch_48
    .end packed-switch
.end method

.method private static warn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 97
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 98
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->writeToFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    return-void
.end method

.method private static writeToFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 102
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->pr:Ljava/io/PrintWriter;

    if-eqz v0, :cond_27

    .line 103
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->pr:Ljava/io/PrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 104
    if-eqz p2, :cond_27

    .line 105
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->pr:Ljava/io/PrintWriter;

    invoke-virtual {p2, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 108
    :cond_27
    return-void
.end method
