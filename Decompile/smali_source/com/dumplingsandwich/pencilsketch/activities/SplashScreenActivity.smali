.class public Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;
.super Landroid/app/Activity;
.source "SplashScreenActivity.java"


# instance fields
.field private timerCanceled:Z

.field private waitTimer:Ljava/util/Timer;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->startMainActivity()V

    return-void
.end method

.method private startMainActivity()V
    .registers 3

    .prologue
    .line 69
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/dumplingsandwich/pencilsketch/activities/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 70
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->startActivity(Landroid/content/Intent;)V

    .line 71
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->finish()V

    .line 72
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->requestWindowFeature(I)Z

    .line 27
    const v0, 0x7f030026

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->setContentView(I)V

    .line 30
    invoke-static {p0}, Lcom/dumplingsandwich/pencilsketch/ads/AdmobInterstitialUtils;->initializeAdmobInterstitial(Landroid/app/Activity;)V

    .line 33
    invoke-static {p0}, Lcom/dumplingsandwich/pencilsketch/ads/FacebookInterstitialUtils;->initializeFacebookInterstitialAd(Landroid/app/Activity;)V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->timerCanceled:Z

    .line 37
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->waitTimer:Ljava/util/Timer;

    .line 38
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->waitTimer:Ljava/util/Timer;

    new-instance v1, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;

    invoke-direct {v1, p0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;)V

    const-wide/16 v2, 0x1194

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 50
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->waitTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->timerCanceled:Z

    .line 56
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 57
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 61
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 62
    iget-boolean v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->timerCanceled:Z

    if-eqz v0, :cond_a

    .line 64
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->startMainActivity()V

    .line 66
    :cond_a
    return-void
.end method
