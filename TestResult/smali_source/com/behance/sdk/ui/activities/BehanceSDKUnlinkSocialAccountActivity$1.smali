.class Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity$1;
.super Ljava/lang/Object;
.source "BehanceSDKUnlinkSocialAccountActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->displayConfirmationDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity$1;->this$0:Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity$1;->this$0:Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;

    sget v1, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_CANCELLED:I

    # invokes: Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeThisActivity(I)V
    invoke-static {v0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->access$000(Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;I)V

    .line 97
    return-void
.end method
