.class public final Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;
.super Ljava/lang/Object;
.source "ReceiptFactory.java"


# static fields
.field private static sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;


# direct methods
.method public static getReceiptManager(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    if-nez v1, :cond_17

    .line 13
    const-class v2, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;

    monitor-enter v2

    .line 14
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    .line 15
    .local v0, "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    if-nez v0, :cond_16

    .line 16
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;

    monitor-enter v3
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_1d

    .line 17
    :try_start_e
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    .line 18
    monitor-exit v3
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_1a

    .line 20
    :cond_16
    :try_start_16
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_1d

    .line 22
    .end local v0    # "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    :cond_17
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->sInstance:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    return-object v1

    .line 18
    .restart local v0    # "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    :catchall_1a
    move-exception v1

    :try_start_1b
    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    :try_start_1c
    throw v1

    .line 20
    .end local v0    # "inst":Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    :catchall_1d
    move-exception v1

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_1d

    throw v1
.end method
