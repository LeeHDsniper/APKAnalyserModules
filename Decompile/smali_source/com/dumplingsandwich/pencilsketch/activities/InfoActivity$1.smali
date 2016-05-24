.class Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$1;
.super Ljava/lang/Object;
.source "InfoActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->initializeAdobeAccountManager()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V
    .registers 2

    .prologue
    .line 38
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 2
    .param p1, "e"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 48
    return-void
.end method

.method public onSuccess()V
    .registers 4

    .prologue
    .line 41
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    const-string v1, "User logged out."

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 42
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$1;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    invoke-virtual {v0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->invalidateOptionsMenu()V

    .line 43
    return-void
.end method
