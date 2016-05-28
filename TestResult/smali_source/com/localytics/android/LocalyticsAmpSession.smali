.class public Lcom/localytics/android/LocalyticsAmpSession;
.super Lcom/localytics/android/LocalyticsSession;
.source "LocalyticsAmpSession.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/LocalyticsAmpSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/localytics/android/LocalyticsAmpSession;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "referrerID"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    sget-object v0, Lcom/localytics/android/LocalyticsAmpSession;->sSessionHandlerThread:Landroid/os/HandlerThread;

    const-class v1, Lcom/localytics/android/AmpSessionHandler;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/HandlerThread;->setName(Ljava/lang/String;)V

    .line 84
    invoke-direct {p0, p1}, Lcom/localytics/android/LocalyticsAmpSession;->createLocalyticsDirectory(Landroid/content/Context;)Z

    .line 85
    return-void
.end method

.method private createLocalyticsDirectory(Landroid/content/Context;)Z
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 330
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    const-string v2, ".localytics"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 337
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_31

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_31

    .line 339
    const/4 v2, 0x0

    .line 342
    :goto_30
    return v2

    :cond_31
    const/4 v2, 0x1

    goto :goto_30
.end method

.method public static isTestModeEnabled()Z
    .registers 1

    .prologue
    .line 298
    invoke-static {}, Lcom/localytics/android/AmpConstants;->isTestModeEnabled()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public attach(Landroid/support/v4/app/FragmentActivity;)V
    .registers 5
    .param p1, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 158
    if-nez p1, :cond_a

    .line 160
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "attached activity cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_a
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsAmpSession;->getSessionHandler()Lcom/localytics/android/SessionHandler;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/AmpSessionHandler;

    .line 164
    .local v0, "handler":Lcom/localytics/android/AmpSessionHandler;
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->setFragmentManager(Landroid/support/v4/app/FragmentManager;)V

    .line 166
    invoke-static {}, Lcom/localytics/android/LocalyticsAmpSession;->isTestModeEnabled()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 168
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 170
    :cond_26
    return-void
.end method

.method protected createSessionHandler(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/SessionHandler;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 496
    new-instance v0, Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {v0, p1, p2, p3}, Lcom/localytics/android/AmpSessionHandler;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V

    return-object v0
.end method

.method public detach()V
    .registers 3

    .prologue
    .line 177
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsAmpSession;->getSessionHandler()Lcom/localytics/android/SessionHandler;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/AmpSessionHandler;

    .line 178
    .local v0, "handler":Lcom/localytics/android/AmpSessionHandler;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->setFragmentManager(Landroid/support/v4/app/FragmentManager;)V

    .line 179
    return-void
.end method

.method protected uploadAnalytics()V
    .registers 4

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsAmpSession;->getSessionHandler()Lcom/localytics/android/SessionHandler;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/AmpSessionHandler;

    .line 94
    .local v0, "handler":Lcom/localytics/android/AmpSessionHandler;
    const/4 v1, 0x4

    new-instance v2, Lcom/localytics/android/LocalyticsAmpSession$1;

    invoke-direct {v2, p0, v0}, Lcom/localytics/android/LocalyticsAmpSession$1;-><init>(Lcom/localytics/android/LocalyticsAmpSession;Lcom/localytics/android/AmpSessionHandler;)V

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 101
    return-void
.end method
