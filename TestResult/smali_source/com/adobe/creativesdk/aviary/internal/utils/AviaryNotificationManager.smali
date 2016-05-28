.class public final Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;
.super Ljava/lang/Object;
.source "AviaryNotificationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;


# instance fields
.field private final logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->INSTANCE:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-string v0, "NotificationUtils"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 36
    return-void
.end method

.method public static addLargeIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "builder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 200
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getLargeIcon(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 201
    .local v0, "icon":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_9

    .line 202
    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 204
    :cond_9
    return-object p1
.end method

.method static addSmallIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "builder"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .prologue
    .line 218
    sget v0, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_notification_item_installed:I

    invoke-virtual {p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    .line 219
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$color;->com_adobe_image_color_light_gray4:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setColor(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static createNew(Landroid/content/Context;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 151
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v0, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 153
    invoke-static {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->addSmallIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    return-object v1
.end method

.method private extractPackIcon(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "iconPath"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 164
    const/4 v4, 0x0

    .line 165
    .local v4, "largeIcon":Landroid/graphics/Bitmap;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 166
    .local v3, "imgFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_e

    .line 195
    :cond_d
    :goto_d
    return-object v5

    .line 170
    :cond_e
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 172
    .local v1, "icon":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_d

    .line 177
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_notification_large_icon_size:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 178
    .local v0, "finalSize":I
    invoke-static {v1, v0, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->resizeBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 180
    .local v2, "icon2":Landroid/graphics/Bitmap;
    if-eq v2, v1, :cond_31

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v5

    if-nez v5, :cond_31

    .line 181
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 184
    :cond_31
    if-eqz v2, :cond_4d

    .line 185
    sget-boolean v5, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-eqz v5, :cond_4f

    .line 186
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-static {v2, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->circleMask(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 188
    if-eq v4, v2, :cond_4d

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v5

    if-nez v5, :cond_4d

    .line 189
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    :cond_4d
    :goto_4d
    move-object v5, v4

    .line 195
    goto :goto_d

    .line 192
    :cond_4f
    move-object v4, v2

    goto :goto_4d
.end method

.method public static getInstance()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->INSTANCE:Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;

    return-object v0
.end method

.method static getLargeIcon(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 224
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_notification_large_icon:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 225
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_11

    .line 226
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->extractDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 228
    :goto_10
    return-object v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method

.method static getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 208
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    return-object v0
.end method

.method static getNotificationSuccessIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 157
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 158
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISSED"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    const/4 v1, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method static getNullPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 338
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-static {p0, v1, v0, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method private static getPrefsInstalledPacks(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;Ljava/lang/String;)[Ljava/lang/String;
    .registers 9
    .param p0, "prefs"    # Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .param p1, "newItem"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 121
    const-string v4, "aviary.notifications.packs_installed_list"

    const-string v5, ""

    invoke-virtual {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "current":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2f

    .line 127
    :try_start_f
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_14} :catch_29

    move-result-object v2

    .line 136
    .local v2, "splitted":[Ljava/lang/String;
    :goto_15
    if-eqz v2, :cond_31

    array-length v4, v2

    if-lez v4, :cond_31

    .line 137
    array-length v4, v2

    add-int/lit8 v4, v4, 0x1

    new-array v1, v4, [Ljava/lang/String;

    .line 138
    .local v1, "result":[Ljava/lang/String;
    array-length v4, v2

    invoke-static {v2, v6, v1, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    :goto_23
    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    aput-object p1, v1, v4

    .line 144
    return-object v1

    .line 128
    .end local v1    # "result":[Ljava/lang/String;
    .end local v2    # "splitted":[Ljava/lang/String;
    :catch_29
    move-exception v3

    .line 129
    .local v3, "t":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 130
    const/4 v2, 0x0

    .line 131
    .restart local v2    # "splitted":[Ljava/lang/String;
    goto :goto_15

    .line 133
    .end local v2    # "splitted":[Ljava/lang/String;
    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_2f
    const/4 v2, 0x0

    .restart local v2    # "splitted":[Ljava/lang/String;
    goto :goto_15

    .line 140
    :cond_31
    const/4 v4, 0x1

    new-array v1, v4, [Ljava/lang/String;

    .restart local v1    # "result":[Ljava/lang/String;
    goto :goto_23
.end method

.method private updatePrefsActiveNotification(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;[Ljava/lang/String;I)V
    .registers 6
    .param p1, "prefs"    # Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .param p2, "packs"    # [Ljava/lang/String;
    .param p3, "number"    # I

    .prologue
    .line 212
    const-string v0, "aviary.notifications.packs_installed_count"

    invoke-virtual {p1, v0, p3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putInt(Ljava/lang/String;I)V

    .line 213
    const-string v0, "aviary.notifications.packs_installed_list"

    const-string v1, ","

    invoke-static {p2, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    return-void
.end method


# virtual methods
.method public cancelPackInstalledNotification(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 278
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cancelPackInstalledNotification"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 279
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    const v1, 0x53f24

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 280
    return-void
.end method

.method public cancelRestoreOngoingNotification(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 283
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cancelRestoreOngoingNotification"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 284
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    const v1, 0x53f25

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 285
    return-void
.end method

.method public createRestoreOngoingNotification(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 288
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager$RestoreNotification;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public notifyPackDownloadFailed(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "displayName"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "notifyPackDownloadFailed: %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 244
    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_download_failed:I

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 247
    .local v4, "title":Ljava/lang/String;
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 248
    move-object v2, v4

    .line 253
    .local v2, "contentText":Ljava/lang/String;
    :goto_1e
    new-instance v1, Landroid/content/Intent;

    const-class v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    invoke-direct {v1, p1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 254
    .local v1, "contentDownloadIntent":Landroid/content/Intent;
    const-string v5, "aviary.android.cds.intent.action.ACTION_DOWNLOAD_PACKS_CONTENT"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    const-string v5, "entryId"

    invoke-virtual {v1, v5, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 257
    const/4 v5, 0x0

    const/high16 v6, 0x8000000

    .line 258
    invoke-static {p1, v5, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 261
    .local v3, "redownloadIntent":Landroid/app/PendingIntent;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->createNew(Landroid/content/Context;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const v6, 0x1080078

    .line 262
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 263
    invoke-virtual {v5, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 264
    invoke-virtual {v5, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 265
    invoke-virtual {v5, p4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x1

    .line 266
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const-string v6, "err"

    .line 267
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x2

    .line 268
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 269
    invoke-virtual {v5, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    .line 271
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v5

    long-to-int v6, p2

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 272
    return-void

    .line 250
    .end local v0    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v1    # "contentDownloadIntent":Landroid/content/Intent;
    .end local v2    # "contentText":Ljava/lang/String;
    .end local v3    # "redownloadIntent":Landroid/app/PendingIntent;
    :cond_6e
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "contentText":Ljava/lang/String;
    goto :goto_1e
.end method

.method public notifyPackInstalled(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 25
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "iconPath"    # Ljava/lang/String;
    .param p3, "displayName"    # Ljava/lang/String;

    .prologue
    .line 50
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v16, v0

    const-string v17, "notifyPackInstalled: %s"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object p3, v18, v19

    invoke-interface/range {v16 .. v18}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v11

    .line 53
    .local v11, "prefs":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    const-string v16, "aviary.notifications.packs_installed_count"

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v11, v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 54
    .local v3, "activeNotifications":I
    const/4 v9, 0x0

    .line 56
    .local v9, "largeIcon":Landroid/graphics/Bitmap;
    sget v16, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_pack_installed:I

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 57
    .local v6, "installedStr":Ljava/lang/CharSequence;
    sget v16, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_notification_installed_summary:I

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 59
    .local v7, "installedSummaryStr":Ljava/lang/CharSequence;
    move-object/from16 v0, p3

    invoke-static {v11, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getPrefsInstalledPacks(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 61
    .local v10, "packs":[Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->createNew(Landroid/content/Context;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v4

    .line 62
    .local v4, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 63
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationSuccessIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 64
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationSuccessIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 65
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 67
    if-lez v3, :cond_175

    .line 68
    sget v16, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_plugins_installed_count:I

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    add-int/lit8 v19, v3, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    move-object/from16 v0, p1

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 69
    .local v15, "title":Ljava/lang/String;
    invoke-virtual {v4, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 72
    sget-boolean v16, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v16, :cond_14e

    .line 73
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v16

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 74
    add-int/lit8 v16, v3, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 76
    if-eqz v10, :cond_12e

    array-length v0, v10

    move/from16 v16, v0

    if-lez v16, :cond_12e

    .line 77
    new-instance v13, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v13}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    .line 79
    .local v13, "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    const/4 v5, 0x0

    .line 80
    .local v5, "i":I
    array-length v0, v10

    move/from16 v17, v0

    const/16 v16, 0x0

    :goto_d6
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_e9

    aget-object v8, v10, v16

    .line 81
    .local v8, "item":Ljava/lang/String;
    invoke-virtual {v13, v8}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 82
    add-int/lit8 v5, v5, 0x1

    const/16 v18, 0x2

    move/from16 v0, v18

    if-le v5, v0, :cond_14b

    .line 87
    .end local v8    # "item":Ljava/lang/String;
    :cond_e9
    array-length v0, v10

    move/from16 v16, v0

    const/16 v17, 0x3

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_12b

    .line 88
    array-length v0, v10

    move/from16 v16, v0

    add-int/lit8 v12, v16, -0x3

    .line 89
    .local v12, "rest":I
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "+"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_plus_more:I

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, p1

    move/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 90
    .local v14, "summary":Ljava/lang/String;
    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 93
    .end local v12    # "rest":I
    .end local v14    # "summary":Ljava/lang/String;
    :cond_12b
    invoke-virtual {v4, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 108
    .end local v5    # "i":I
    .end local v13    # "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .end local v15    # "title":Ljava/lang/String;
    :cond_12e
    :goto_12e
    if-eqz v9, :cond_188

    .line 109
    invoke-virtual {v4, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 116
    :cond_133
    :goto_133
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v16

    const v17, 0x53f24

    invoke-virtual {v4}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v18

    invoke-virtual/range {v16 .. v18}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 117
    add-int/lit8 v16, v3, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v11, v10, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->updatePrefsActiveNotification(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;[Ljava/lang/String;I)V

    .line 118
    return-void

    .line 80
    .restart local v5    # "i":I
    .restart local v8    # "item":Ljava/lang/String;
    .restart local v13    # "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .restart local v15    # "title":Ljava/lang/String;
    :cond_14b
    add-int/lit8 v16, v16, 0x1

    goto :goto_d6

    .line 97
    .end local v5    # "i":I
    .end local v8    # "item":Ljava/lang/String;
    .end local v13    # "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    :cond_14e
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, ","

    move-object/from16 v0, v17

    invoke-static {v10, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_12e

    .line 100
    .end local v15    # "title":Ljava/lang/String;
    :cond_175
    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 101
    invoke-virtual {v4, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 103
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-nez v16, :cond_12e

    .line 104
    invoke-direct/range {p0 .. p2}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->extractPackIcon(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v9

    goto :goto_12e

    .line 111
    :cond_188
    sget-boolean v16, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-nez v16, :cond_133

    .line 112
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->addLargeIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_133
.end method

.method public notifyRestoreCompleteWithErrors(Landroid/content/Context;Ljava/util/List;)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "errorList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 298
    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_some_items_cant_be_restored:I

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 299
    .local v2, "errorMessage":Ljava/lang/String;
    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_please_try_again_later:I

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 300
    .local v4, "subText":Ljava/lang/String;
    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_n_items_cant_be_restored:I

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 303
    .local v5, "titleText":Ljava/lang/String;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->createNew(Landroid/content/Context;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    new-array v7, v9, [Ljava/lang/Object;

    .line 304
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 305
    invoke-virtual {v6, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 306
    invoke-virtual {v6, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 307
    invoke-virtual {v6, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 308
    invoke-virtual {v6, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 309
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNullPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    const/4 v7, 0x2

    .line 310
    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    .line 311
    invoke-virtual {v6, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v6

    const v7, 0x1080078

    .line 312
    invoke-virtual {v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    .line 314
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    sget-boolean v6, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-nez v6, :cond_97

    .line 315
    invoke-static {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->addLargeIcon(Landroid/content/Context;Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 316
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v9, :cond_6e

    .line 317
    invoke-interface {p2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Exception;

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 329
    :cond_6e
    :goto_6e
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v6

    const v7, 0x53f26

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 331
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_80
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_ca

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Exception;

    .line 332
    .local v1, "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "------ exception ------"

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 333
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_80

    .line 320
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_97
    new-instance v3, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v3}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    .line 321
    .local v3, "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_notification_some_items_cant_be_restored:I

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 322
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_a9
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_bd

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Exception;

    .line 323
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    goto :goto_a9

    .line 325
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_bd
    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_please_try_again_later:I

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 326
    invoke-virtual {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_6e

    .line 335
    .end local v3    # "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    :cond_ca
    return-void
.end method
