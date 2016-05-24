.class Lcom/facebook/LoginActivity$2;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Lcom/facebook/AuthorizationClient$BackgroundProcessingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/LoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/LoginActivity;


# direct methods
.method constructor <init>(Lcom/facebook/LoginActivity;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/LoginActivity$2;->this$0:Lcom/facebook/LoginActivity;

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackgroundProcessingStarted()V
    .registers 3

    .prologue
    .line 79
    iget-object v0, p0, Lcom/facebook/LoginActivity$2;->this$0:Lcom/facebook/LoginActivity;

    sget v1, Lcom/behance/sdk/R$id;->com_facebook_login_activity_progress_bar:I

    invoke-virtual {v0, v1}, Lcom/facebook/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    return-void
.end method

.method public onBackgroundProcessingStopped()V
    .registers 3

    .prologue
    .line 84
    iget-object v0, p0, Lcom/facebook/LoginActivity$2;->this$0:Lcom/facebook/LoginActivity;

    sget v1, Lcom/behance/sdk/R$id;->com_facebook_login_activity_progress_bar:I

    invoke-virtual {v0, v1}, Lcom/facebook/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 85
    return-void
.end method
