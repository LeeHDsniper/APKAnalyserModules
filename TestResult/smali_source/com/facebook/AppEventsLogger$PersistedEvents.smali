.class Lcom/facebook/AppEventsLogger$PersistedEvents;
.super Ljava/lang/Object;
.source "AppEventsLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AppEventsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PersistedEvents"
.end annotation


# static fields
.field private static staticLock:Ljava/lang/Object;


# instance fields
.field private context:Landroid/content/Context;

.field private persistedEvents:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1478
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/facebook/AppEventsLogger$PersistedEvents;->staticLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1482
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    .line 1485
    iput-object p1, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->context:Landroid/content/Context;

    .line 1486
    return-void
.end method

.method public static persistEvents(Landroid/content/Context;Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$SessionEventsState;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "accessTokenAppId"    # Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;
    .param p2, "eventsToPersist"    # Lcom/facebook/AppEventsLogger$SessionEventsState;

    .prologue
    .line 1500
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1501
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$SessionEventsState;>;"
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1502
    invoke-static {p0, v0}, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistEvents(Landroid/content/Context;Ljava/util/Map;)V

    .line 1503
    return-void
.end method

.method public static persistEvents(Landroid/content/Context;Ljava/util/Map;)V
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;",
            "Lcom/facebook/AppEventsLogger$SessionEventsState;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1507
    .local p1, "eventsToPersist":Ljava/util/Map;, "Ljava/util/Map<Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$SessionEventsState;>;"
    sget-object v4, Lcom/facebook/AppEventsLogger$PersistedEvents;->staticLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1512
    :try_start_3
    invoke-static {p0}, Lcom/facebook/AppEventsLogger$PersistedEvents;->readAndClearStore(Landroid/content/Context;)Lcom/facebook/AppEventsLogger$PersistedEvents;

    move-result-object v2

    .line 1514
    .local v2, "persistedEvents":Lcom/facebook/AppEventsLogger$PersistedEvents;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_f
    :goto_f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1a

    .line 1523
    invoke-direct {v2}, Lcom/facebook/AppEventsLogger$PersistedEvents;->write()V

    .line 1507
    monitor-exit v4

    .line 1525
    return-void

    .line 1514
    :cond_1a
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1515
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$SessionEventsState;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/AppEventsLogger$SessionEventsState;

    invoke-virtual {v3}, Lcom/facebook/AppEventsLogger$SessionEventsState;->getEventsToPersist()Ljava/util/List;

    move-result-object v1

    .line 1516
    .local v1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_f

    .line 1520
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    invoke-virtual {v2, v3, v1}, Lcom/facebook/AppEventsLogger$PersistedEvents;->addEvents(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Ljava/util/List;)V

    goto :goto_f

    .line 1507
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Lcom/facebook/AppEventsLogger$SessionEventsState;>;"
    .end local v1    # "events":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;"
    .end local v2    # "persistedEvents":Lcom/facebook/AppEventsLogger$PersistedEvents;
    :catchall_3a
    move-exception v3

    monitor-exit v4
    :try_end_3c
    .catchall {:try_start_3 .. :try_end_3c} :catchall_3a

    throw v3
.end method

.method public static readAndClearStore(Landroid/content/Context;)Lcom/facebook/AppEventsLogger$PersistedEvents;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1489
    sget-object v2, Lcom/facebook/AppEventsLogger$PersistedEvents;->staticLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1490
    :try_start_3
    new-instance v0, Lcom/facebook/AppEventsLogger$PersistedEvents;

    invoke-direct {v0, p0}, Lcom/facebook/AppEventsLogger$PersistedEvents;-><init>(Landroid/content/Context;)V

    .line 1492
    .local v0, "persistedEvents":Lcom/facebook/AppEventsLogger$PersistedEvents;
    invoke-direct {v0}, Lcom/facebook/AppEventsLogger$PersistedEvents;->readAndClearStore()V

    .line 1494
    monitor-exit v2

    return-object v0

    .line 1489
    .end local v0    # "persistedEvents":Lcom/facebook/AppEventsLogger$PersistedEvents;
    :catchall_d
    move-exception v1

    monitor-exit v2
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v1
.end method

.method private readAndClearStore()V
    .registers 8

    .prologue
    .line 1549
    const/4 v2, 0x0

    .line 1551
    .local v2, "ois":Ljava/io/ObjectInputStream;
    :try_start_1
    new-instance v3, Ljava/io/ObjectInputStream;

    .line 1552
    new-instance v4, Ljava/io/BufferedInputStream;

    iget-object v5, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->context:Landroid/content/Context;

    const-string v6, "AppEventsLogger.persistedevents"

    invoke-virtual {v5, v6}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1551
    invoke-direct {v3, v4}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_13
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_13} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_13} :catch_30
    .catchall {:try_start_1 .. :try_end_13} :catchall_4f

    .line 1556
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .local v3, "ois":Ljava/io/ObjectInputStream;
    :try_start_13
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 1560
    .local v1, "obj":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;>;"
    iget-object v4, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->context:Landroid/content/Context;

    const-string v5, "AppEventsLogger.persistedevents"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 1561
    iput-object v1, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;
    :try_end_26
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_26} :catch_5a
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_26} :catch_57
    .catchall {:try_start_13 .. :try_end_26} :catchall_54

    .line 1567
    invoke-static {v3}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    move-object v2, v3

    .line 1569
    .end local v1    # "obj":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;>;"
    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    :goto_2a
    return-void

    .line 1562
    :catch_2b
    move-exception v4

    .line 1567
    :goto_2c
    invoke-static {v2}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_2a

    .line 1564
    :catch_30
    move-exception v0

    .line 1565
    .local v0, "e":Ljava/lang/Exception;
    :goto_31
    :try_start_31
    # getter for: Lcom/facebook/AppEventsLogger;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/facebook/AppEventsLogger;->access$1()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Got unexpected exception: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4b
    .catchall {:try_start_31 .. :try_end_4b} :catchall_4f

    .line 1567
    invoke-static {v2}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_2a

    .line 1566
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_4f
    move-exception v4

    .line 1567
    :goto_50
    invoke-static {v2}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    .line 1568
    throw v4

    .line 1566
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "ois":Ljava/io/ObjectInputStream;
    :catchall_54
    move-exception v4

    move-object v2, v3

    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_50

    .line 1564
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "ois":Ljava/io/ObjectInputStream;
    :catch_57
    move-exception v0

    move-object v2, v3

    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_31

    .line 1562
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "ois":Ljava/io/ObjectInputStream;
    :catch_5a
    move-exception v4

    move-object v2, v3

    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_2c
.end method

.method private write()V
    .registers 8

    .prologue
    .line 1536
    const/4 v1, 0x0

    .line 1538
    .local v1, "oos":Ljava/io/ObjectOutputStream;
    :try_start_1
    new-instance v2, Ljava/io/ObjectOutputStream;

    .line 1539
    new-instance v3, Ljava/io/BufferedOutputStream;

    iget-object v4, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->context:Landroid/content/Context;

    const-string v5, "AppEventsLogger.persistedevents"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1538
    invoke-direct {v2, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_1e
    .catchall {:try_start_1 .. :try_end_14} :catchall_3d

    .line 1540
    .end local v1    # "oos":Ljava/io/ObjectOutputStream;
    .local v2, "oos":Ljava/io/ObjectOutputStream;
    :try_start_14
    iget-object v3, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_19} :catch_45
    .catchall {:try_start_14 .. :try_end_19} :catchall_42

    .line 1544
    invoke-static {v2}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    move-object v1, v2

    .line 1546
    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v1    # "oos":Ljava/io/ObjectOutputStream;
    :goto_1d
    return-void

    .line 1541
    :catch_1e
    move-exception v0

    .line 1542
    .local v0, "e":Ljava/lang/Exception;
    :goto_1f
    :try_start_1f
    # getter for: Lcom/facebook/AppEventsLogger;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/facebook/AppEventsLogger;->access$1()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Got unexpected exception: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_39
    .catchall {:try_start_1f .. :try_end_39} :catchall_3d

    .line 1544
    invoke-static {v1}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_1d

    .line 1543
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_3d
    move-exception v3

    .line 1544
    :goto_3e
    invoke-static {v1}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    .line 1545
    throw v3

    .line 1543
    .end local v1    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v2    # "oos":Ljava/io/ObjectOutputStream;
    :catchall_42
    move-exception v3

    move-object v1, v2

    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v1    # "oos":Ljava/io/ObjectOutputStream;
    goto :goto_3e

    .line 1541
    .end local v1    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v2    # "oos":Ljava/io/ObjectOutputStream;
    :catch_45
    move-exception v0

    move-object v1, v2

    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v1    # "oos":Ljava/io/ObjectOutputStream;
    goto :goto_1f
.end method


# virtual methods
.method public addEvents(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;Ljava/util/List;)V
    .registers 5
    .param p1, "accessTokenAppId"    # Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1572
    .local p2, "eventsToPersist":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;"
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 1573
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1575
    :cond_12
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1576
    return-void
.end method

.method public getEvents(Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;)Ljava/util/List;
    .registers 3
    .param p1, "accessTokenAppId"    # Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1532
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1528
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$PersistedEvents;->persistedEvents:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
