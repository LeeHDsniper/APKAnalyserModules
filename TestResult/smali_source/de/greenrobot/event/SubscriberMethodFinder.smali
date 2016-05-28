.class Lde/greenrobot/event/SubscriberMethodFinder;
.super Ljava/lang/Object;
.source "SubscriberMethodFinder.java"


# static fields
.field private static final methodCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lde/greenrobot/event/SubscriberMethod;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final skipMethodVerificationForClasses:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lde/greenrobot/event/SubscriberMethodFinder;->methodCache:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "skipMethodVerificationForClassesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lde/greenrobot/event/SubscriberMethodFinder;->skipMethodVerificationForClasses:Ljava/util/Map;

    .line 47
    if-eqz p1, :cond_22

    .line 48
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 49
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lde/greenrobot/event/SubscriberMethodFinder;->skipMethodVerificationForClasses:Ljava/util/Map;

    invoke-interface {v2, v0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 52
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_22
    return-void
.end method


# virtual methods
.method findSubscriberMethods(Ljava/lang/Class;)Ljava/util/List;
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Lde/greenrobot/event/SubscriberMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "subscriberClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 57
    .local v7, "key":Ljava/lang/String;
    sget-object v22, Lde/greenrobot/event/SubscriberMethodFinder;->methodCache:Ljava/util/Map;

    monitor-enter v22

    .line 58
    :try_start_7
    sget-object v21, Lde/greenrobot/event/SubscriberMethodFinder;->methodCache:Ljava/util/Map;

    move-object/from16 v0, v21

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/List;

    .line 59
    .local v18, "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    monitor-exit v22

    .line 60
    if-eqz v18, :cond_1a

    move-object/from16 v19, v18

    .line 125
    .end local v18    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    .local v19, "subscriberMethods":Ljava/lang/Object;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    :goto_16
    return-object v19

    .line 59
    .end local v19    # "subscriberMethods":Ljava/lang/Object;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    :catchall_17
    move-exception v21

    monitor-exit v22
    :try_end_19
    .catchall {:try_start_7 .. :try_end_19} :catchall_17

    throw v21

    .line 63
    .restart local v18    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    :cond_1a
    new-instance v18, Ljava/util/ArrayList;

    .end local v18    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .restart local v18    # "subscriberMethods":Ljava/util/List;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    move-object/from16 v3, p1

    .line 65
    .local v3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 66
    .local v5, "eventTypesFound":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .local v11, "methodKeyBuilder":Ljava/lang/StringBuilder;
    :goto_2b
    if-eqz v3, :cond_55

    .line 68
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    .line 69
    .local v16, "name":Ljava/lang/String;
    const-string v21, "java."

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_55

    const-string v21, "javax."

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_55

    const-string v21, "android."

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_84

    .line 118
    .end local v16    # "name":Ljava/lang/String;
    :cond_55
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v21

    if-eqz v21, :cond_196

    .line 119
    new-instance v21, Lde/greenrobot/event/EventBusException;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Subscriber "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, " has no public methods called "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "onEvent"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lde/greenrobot/event/EventBusException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 75
    .restart local v16    # "name":Ljava/lang/String;
    :cond_84
    invoke-virtual {v3}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v13

    .line 76
    .local v13, "methods":[Ljava/lang/reflect/Method;
    move-object v2, v13

    .local v2, "arr$":[Ljava/lang/reflect/Method;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_8b
    if-ge v6, v8, :cond_190

    aget-object v9, v2, v6

    .line 77
    .local v9, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v12

    .line 78
    .local v12, "methodName":Ljava/lang/String;
    const-string v21, "onEvent"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_107

    .line 79
    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v15

    .line 80
    .local v15, "modifiers":I
    and-int/lit8 v21, v15, 0x1

    if-eqz v21, :cond_15a

    and-int/lit16 v0, v15, 0x1448

    move/from16 v21, v0

    if-nez v21, :cond_15a

    .line 81
    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v17

    .line 82
    .local v17, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_107

    .line 83
    const-string v21, "onEvent"

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 85
    .local v14, "modifierString":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_10a

    .line 86
    sget-object v20, Lde/greenrobot/event/ThreadMode;->PostThread:Lde/greenrobot/event/ThreadMode;

    .line 100
    .local v20, "threadMode":Lde/greenrobot/event/ThreadMode;
    :goto_d0
    const/16 v21, 0x0

    aget-object v4, v17, v21

    .line 101
    .local v4, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 102
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    const/16 v21, 0x3e

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 105
    .local v10, "methodKey":Ljava/lang/String;
    invoke-virtual {v5, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_107

    .line 107
    new-instance v21, Lde/greenrobot/event/SubscriberMethod;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v9, v1, v4}, Lde/greenrobot/event/SubscriberMethod;-><init>(Ljava/lang/reflect/Method;Lde/greenrobot/event/ThreadMode;Ljava/lang/Class;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .end local v4    # "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "methodKey":Ljava/lang/String;
    .end local v14    # "modifierString":Ljava/lang/String;
    .end local v15    # "modifiers":I
    .end local v17    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    :cond_107
    :goto_107
    add-int/lit8 v6, v6, 0x1

    goto :goto_8b

    .line 87
    .restart local v14    # "modifierString":Ljava/lang/String;
    .restart local v15    # "modifiers":I
    .restart local v17    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_10a
    const-string v21, "MainThread"

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_117

    .line 88
    sget-object v20, Lde/greenrobot/event/ThreadMode;->MainThread:Lde/greenrobot/event/ThreadMode;

    .restart local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    goto :goto_d0

    .line 89
    .end local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    :cond_117
    const-string v21, "BackgroundThread"

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_124

    .line 90
    sget-object v20, Lde/greenrobot/event/ThreadMode;->BackgroundThread:Lde/greenrobot/event/ThreadMode;

    .restart local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    goto :goto_d0

    .line 91
    .end local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    :cond_124
    const-string v21, "Async"

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_131

    .line 92
    sget-object v20, Lde/greenrobot/event/ThreadMode;->Async:Lde/greenrobot/event/ThreadMode;

    .restart local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    goto :goto_d0

    .line 94
    .end local v20    # "threadMode":Lde/greenrobot/event/ThreadMode;
    :cond_131
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/greenrobot/event/SubscriberMethodFinder;->skipMethodVerificationForClasses:Ljava/util/Map;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_107

    .line 97
    new-instance v21, Lde/greenrobot/event/EventBusException;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Illegal onEvent method, check for typos: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lde/greenrobot/event/EventBusException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 110
    .end local v14    # "modifierString":Ljava/lang/String;
    .end local v17    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_15a
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/greenrobot/event/SubscriberMethodFinder;->skipMethodVerificationForClasses:Ljava/util/Map;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_107

    .line 111
    sget-object v21, Lde/greenrobot/event/EventBus;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Skipping method (not public, static or abstract): "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_107

    .line 116
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v12    # "methodName":Ljava/lang/String;
    .end local v15    # "modifiers":I
    :cond_190
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    .line 117
    goto/16 :goto_2b

    .line 122
    .end local v2    # "arr$":[Ljava/lang/reflect/Method;
    .end local v6    # "i$":I
    .end local v8    # "len$":I
    .end local v13    # "methods":[Ljava/lang/reflect/Method;
    .end local v16    # "name":Ljava/lang/String;
    :cond_196
    sget-object v22, Lde/greenrobot/event/SubscriberMethodFinder;->methodCache:Ljava/util/Map;

    monitor-enter v22

    .line 123
    :try_start_199
    sget-object v21, Lde/greenrobot/event/SubscriberMethodFinder;->methodCache:Ljava/util/Map;

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    monitor-exit v22

    move-object/from16 v19, v18

    .line 125
    .restart local v19    # "subscriberMethods":Ljava/lang/Object;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    goto/16 :goto_16

    .line 124
    .end local v19    # "subscriberMethods":Ljava/lang/Object;, "Ljava/util/List<Lde/greenrobot/event/SubscriberMethod;>;"
    :catchall_1a7
    move-exception v21

    monitor-exit v22
    :try_end_1a9
    .catchall {:try_start_199 .. :try_end_1a9} :catchall_1a7

    throw v21
.end method
