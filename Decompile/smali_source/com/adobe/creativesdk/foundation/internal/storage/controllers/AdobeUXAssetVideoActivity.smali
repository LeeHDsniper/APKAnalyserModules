.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;
.super Landroid/app/Activity;
.source "AdobeUXAssetVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$4;
    }
.end annotation


# instance fields
.field private _assetPos:I

.field private _mediaController:Landroid/widget/MediaController;

.field private _network_reachability_observer:Ljava/util/Observer;

.field private _progressBar:Landroid/widget/ProgressBar;

.field private _stopPosition:I

.field private _vidView:Landroid/widget/VideoView;

.field private noInternet:Z

.field private no_network_banner:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->noInternet:Z

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)Landroid/widget/ProgressBar;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 29
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->wentOnline()V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->wentOffline()V

    return-void
.end method

.method private refreshVideoView()V
    .registers 10

    .prologue
    .line 70
    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_assetPos:I

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    move-object v1, v0

    .line 71
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    .line 73
    .local v1, "file":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->getHlsHref()Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "vidAddress":Ljava/lang/String;
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 75
    .local v3, "vidUri":Landroid/net/Uri;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/VideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 85
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v5, "VideoActivity"

    const-string v6, "VideoUrl is %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 125
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v4, v3}, Landroid/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 126
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v4}, Landroid/widget/VideoView;->start()V

    .line 127
    return-void
.end method

.method private wentOffline()V
    .registers 3

    .prologue
    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->noInternet:Z

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->no_network_banner:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 162
    return-void
.end method

.method private wentOnline()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 166
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->noInternet:Z

    .line 167
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->no_network_banner:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 169
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->refreshVideoView()V

    .line 170
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 43
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 44
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->activity_videoview:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->setContentView(I)V

    .line 46
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_video_viewContainer:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/VideoView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    .line 47
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_videoInit_progressBar:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_progressBar:Landroid/widget/ProgressBar;

    .line 48
    new-instance v0, Landroid/widget/MediaController;

    invoke-direct {v0, p0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_mediaController:Landroid/widget/MediaController;

    .line 49
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_mediaController:Landroid/widget/MediaController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 50
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_mediaController:Landroid/widget/MediaController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_mediaController:Landroid/widget/MediaController;

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    .line 52
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->video_container_no_network_notification_bar:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->no_network_banner:Landroid/view/View;

    .line 55
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isDataSourceValidForAssetViewerLaunch()Z

    move-result v0

    if-nez v0, :cond_4a

    .line 57
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->finish()V

    .line 67
    :goto_49
    return-void

    .line 61
    :cond_4a
    if-eqz p1, :cond_65

    .line 62
    const-string v0, "position"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I

    .line 66
    :goto_54
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "current_asset_position"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_assetPos:I

    goto :goto_49

    .line 64
    :cond_65
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I

    goto :goto_54
.end method

.method protected onDestroy()V
    .registers 3

    .prologue
    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_mediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    .line 219
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setVisibility(I)V

    .line 220
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 221
    return-void
.end method

.method protected onPause()V
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_stopPosition:I

    .line 195
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 197
    return-void
.end method

.method protected onResume()V
    .registers 1

    .prologue
    .line 181
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 182
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->refreshVideoView()V

    .line 183
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 209
    const-string v0, "position"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_vidView:Landroid/widget/VideoView;

    invoke-virtual {v1}, Landroid/widget/VideoView;->getCurrentPosition()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 210
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 211
    return-void
.end method

.method protected onStart()V
    .registers 1

    .prologue
    .line 187
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 188
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->registerLocalNofications()V

    .line 190
    return-void
.end method

.method protected onStop()V
    .registers 1

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->unRegisterLocalNotifications()V

    .line 203
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 205
    return-void
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_network_reachability_observer:Ljava/util/Observer;

    if-nez v0, :cond_b

    .line 133
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_network_reachability_observer:Ljava/util/Observer;

    .line 154
    :cond_b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 157
    return-void
.end method

.method protected unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 174
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 176
    return-void
.end method
