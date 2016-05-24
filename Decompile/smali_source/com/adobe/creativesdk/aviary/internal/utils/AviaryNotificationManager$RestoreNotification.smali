.class public Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;
.super Ljava/lang/Object;
.source "AviaryNotificationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RestoreNotification"
.end annotation


# instance fields
.field private builder:Landroid/support/v4/app/NotificationCompat$Builder;

.field private final context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    .line 345
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 346
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    .line 348
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_restore_all_in_progress:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 350
    .local v0, "text":Ljava/lang/String;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->createNew(Landroid/content/Context;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_restore_all:I

    .line 351
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    .line 352
    invoke-virtual {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    .line 353
    invoke-virtual {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    const/16 v2, 0x64

    const/4 v3, 0x0

    .line 354
    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    .line 355
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNullPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    .line 356
    invoke-virtual {v1, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    .line 358
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-nez v1, :cond_40

    .line 359
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-static {p1, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->addLargeIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 361
    :cond_40
    return-void
.end method


# virtual methods
.method public alertNothingToRestore()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 380
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    sget v3, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_restore_all_completed:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 381
    .local v1, "title":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    sget v3, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_no_items_to_restore:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "text":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->createNew(Landroid/content/Context;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    .line 384
    invoke-virtual {v2, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    .line 385
    invoke-virtual {v2, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    .line 386
    invoke-virtual {v2, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    .line 387
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNullPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    const/4 v3, 0x2

    .line 388
    invoke-virtual {v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    .line 389
    invoke-virtual {v2, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    .line 390
    invoke-virtual {v2, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    const/4 v3, 0x0

    .line 391
    invoke-virtual {v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    .line 393
    sget-boolean v2, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-nez v2, :cond_4c

    .line 394
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->addLargeIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 397
    :cond_4c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v2

    const v3, 0x53f25

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v4}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 398
    return-void
.end method

.method public cancel()V
    .registers 3

    .prologue
    .line 376
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    const v1, 0x53f25

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 377
    return-void
.end method

.method public setProgress(IIZ)V
    .registers 7
    .param p1, "max"    # I
    .param p2, "progress"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 371
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 372
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    const v1, 0x53f25

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;->builder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 373
    return-void
.end method
