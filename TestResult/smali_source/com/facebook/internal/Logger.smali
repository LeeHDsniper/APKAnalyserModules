.class public Lcom/facebook/internal/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field private static final stringsToReplace:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final behavior:Lcom/facebook/LoggingBehavior;

.field private contents:Ljava/lang/StringBuilder;

.field private priority:I

.field private final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/facebook/internal/Logger;->stringsToReplace:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/LoggingBehavior;Ljava/lang/String;)V
    .registers 5
    .param p1, "behavior"    # Lcom/facebook/LoggingBehavior;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x3

    iput v0, p0, Lcom/facebook/internal/Logger;->priority:I

    .line 87
    const-string v0, "tag"

    invoke-static {p2, v0}, Lcom/facebook/internal/Validate;->notNullOrEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iput-object p1, p0, Lcom/facebook/internal/Logger;->behavior:Lcom/facebook/LoggingBehavior;

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FacebookSDK."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/internal/Logger;->tag:Ljava/lang/String;

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/facebook/internal/Logger;->contents:Ljava/lang/StringBuilder;

    .line 92
    return-void
.end method

.method public static log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p0, "behavior"    # Lcom/facebook/LoggingBehavior;
    .param p1, "priority"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "string"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-static {p0}, Lcom/facebook/Settings;->isLoggingBehaviorEnabled(Lcom/facebook/LoggingBehavior;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 65
    invoke-static {p3}, Lcom/facebook/internal/Logger;->replaceStrings(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 66
    const-string v0, "FacebookSDK."

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_21

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FacebookSDK."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 69
    :cond_21
    invoke-static {p1, p2, p3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 73
    sget-object v0, Lcom/facebook/LoggingBehavior;->DEVELOPER_ERRORS:Lcom/facebook/LoggingBehavior;

    if-ne p0, v0, :cond_30

    .line 74
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 77
    :cond_30
    return-void
.end method

.method public static log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "behavior"    # Lcom/facebook/LoggingBehavior;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 53
    const/4 v0, 0x3

    invoke-static {p0, v0, p1, p2}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public static varargs log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p0, "behavior"    # Lcom/facebook/LoggingBehavior;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 57
    invoke-static {p0}, Lcom/facebook/Settings;->isLoggingBehaviorEnabled(Lcom/facebook/LoggingBehavior;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 58
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "string":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-static {p0, v1, p1, v0}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 61
    .end local v0    # "string":Ljava/lang/String;
    :cond_e
    return-void
.end method

.method public static declared-synchronized registerAccessToken(Ljava/lang/String;)V
    .registers 3
    .param p0, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 47
    const-class v1, Lcom/facebook/internal/Logger;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/facebook/LoggingBehavior;->INCLUDE_ACCESS_TOKENS:Lcom/facebook/LoggingBehavior;

    invoke-static {v0}, Lcom/facebook/Settings;->isLoggingBehaviorEnabled(Lcom/facebook/LoggingBehavior;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 48
    const-string v0, "ACCESS_TOKEN_REMOVED"

    invoke-static {p0, v0}, Lcom/facebook/internal/Logger;->registerStringToReplace(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    .line 50
    :cond_10
    monitor-exit v1

    return-void

    .line 47
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized registerStringToReplace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "original"    # Ljava/lang/String;
    .param p1, "replace"    # Ljava/lang/String;

    .prologue
    .line 43
    const-class v1, Lcom/facebook/internal/Logger;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/facebook/internal/Logger;->stringsToReplace:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    .line 44
    monitor-exit v1

    return-void

    .line 43
    :catchall_a
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized replaceStrings(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 80
    const-class v3, Lcom/facebook/internal/Logger;

    monitor-enter v3

    :try_start_3
    sget-object v1, Lcom/facebook/internal/Logger;->stringsToReplace:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_2c

    move-result v1

    if-nez v1, :cond_15

    .line 83
    monitor-exit v3

    return-object p0

    .line 80
    :cond_15
    :try_start_15
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 81
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_2a
    .catchall {:try_start_15 .. :try_end_2a} :catchall_2c

    move-result-object p0

    goto :goto_d

    .line 80
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_2c
    move-exception v1

    monitor-exit v3

    throw v1
.end method

.method private shouldLog()Z
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/facebook/internal/Logger;->behavior:Lcom/facebook/LoggingBehavior;

    invoke-static {v0}, Lcom/facebook/Settings;->isLoggingBehaviorEnabled(Lcom/facebook/LoggingBehavior;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public append(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/facebook/internal/Logger;->shouldLog()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 127
    iget-object v0, p0, Lcom/facebook/internal/Logger;->contents:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :cond_b
    return-void
.end method

.method public varargs append(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 132
    invoke-direct {p0}, Lcom/facebook/internal/Logger;->shouldLog()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 133
    iget-object v0, p0, Lcom/facebook/internal/Logger;->contents:Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    :cond_f
    return-void
.end method

.method public appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 138
    const-string v0, "  %s:\t%s\n"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/facebook/internal/Logger;->append(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 139
    return-void
.end method

.method public log()V
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/facebook/internal/Logger;->contents:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/facebook/internal/Logger;->logString(Ljava/lang/String;)V

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/facebook/internal/Logger;->contents:Ljava/lang/StringBuilder;

    .line 112
    return-void
.end method

.method public logString(Ljava/lang/String;)V
    .registers 5
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/facebook/internal/Logger;->behavior:Lcom/facebook/LoggingBehavior;

    iget v1, p0, Lcom/facebook/internal/Logger;->priority:I

    iget-object v2, p0, Lcom/facebook/internal/Logger;->tag:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 117
    return-void
.end method
