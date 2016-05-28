.class Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1$1;
.super Ljava/lang/Object;
.source "SplashScreenActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;)V
    .registers 2

    .prologue
    .line 41
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1$1;->this$1:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1$1;->this$1:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;

    iget-object v0, v0, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;

    # invokes: Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->startMainActivity()V
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;->access$000(Lcom/dumplingsandwich/pencilsketch/activities/SplashScreenActivity;)V

    .line 46
    return-void
.end method
