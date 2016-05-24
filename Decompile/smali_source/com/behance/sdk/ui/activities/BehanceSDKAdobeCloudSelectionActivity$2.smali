.class Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$2;
.super Ljava/lang/Object;
.source "BehanceSDKAdobeCloudSelectionActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$2;->this$0:Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$2;->this$0:Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    # invokes: Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->handleCloudRetrievingError()V
    invoke-static {v0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->access$100(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;)V

    .line 153
    return-void
.end method
