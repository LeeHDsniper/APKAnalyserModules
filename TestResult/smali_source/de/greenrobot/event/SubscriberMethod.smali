.class final Lde/greenrobot/event/SubscriberMethod;
.super Ljava/lang/Object;
.source "SubscriberMethod.java"


# instance fields
.field final eventType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field final method:Ljava/lang/reflect/Method;

.field methodString:Ljava/lang/String;

.field final threadMode:Lde/greenrobot/event/ThreadMode;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Method;Lde/greenrobot/event/ThreadMode;Ljava/lang/Class;)V
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "threadMode"    # Lde/greenrobot/event/ThreadMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Lde/greenrobot/event/ThreadMode;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p3, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lde/greenrobot/event/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    .line 29
    iput-object p2, p0, Lde/greenrobot/event/SubscriberMethod;->threadMode:Lde/greenrobot/event/ThreadMode;

    .line 30
    iput-object p3, p0, Lde/greenrobot/event/SubscriberMethod;->eventType:Ljava/lang/Class;

    .line 31
    return-void
.end method

.method private declared-synchronized checkMethodString()V
    .registers 4

    .prologue
    .line 47
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lde/greenrobot/event/SubscriberMethod;->methodString:Ljava/lang/String;

    if-nez v1, :cond_3d

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 50
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lde/greenrobot/event/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/event/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/event/SubscriberMethod;->eventType:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/event/SubscriberMethod;->methodString:Ljava/lang/String;
    :try_end_3d
    .catchall {:try_start_1 .. :try_end_3d} :catchall_3f

    .line 55
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_3d
    monitor-exit p0

    return-void

    .line 47
    :catchall_3f
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 35
    instance-of v1, p1, Lde/greenrobot/event/SubscriberMethod;

    if-eqz v1, :cond_16

    .line 36
    invoke-direct {p0}, Lde/greenrobot/event/SubscriberMethod;->checkMethodString()V

    move-object v0, p1

    .line 37
    check-cast v0, Lde/greenrobot/event/SubscriberMethod;

    .line 38
    .local v0, "otherSubscriberMethod":Lde/greenrobot/event/SubscriberMethod;
    invoke-direct {v0}, Lde/greenrobot/event/SubscriberMethod;->checkMethodString()V

    .line 40
    iget-object v1, p0, Lde/greenrobot/event/SubscriberMethod;->methodString:Ljava/lang/String;

    iget-object v2, v0, Lde/greenrobot/event/SubscriberMethod;->methodString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 42
    .end local v0    # "otherSubscriberMethod":Lde/greenrobot/event/SubscriberMethod;
    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lde/greenrobot/event/SubscriberMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->hashCode()I

    move-result v0

    return v0
.end method
