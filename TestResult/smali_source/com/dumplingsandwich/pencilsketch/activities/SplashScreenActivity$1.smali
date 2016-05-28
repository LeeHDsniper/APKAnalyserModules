.class Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;
.super Ljava/util/TimerTask;
.source "SplashScreenActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;)V
    .registers 2

    .prologue
    .line 38
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 41
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;

    new-instance v1, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1$1;

    invoke-direct {v1, p0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;)V

    invoke-virtual {v0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 48
    return-void
.end method
