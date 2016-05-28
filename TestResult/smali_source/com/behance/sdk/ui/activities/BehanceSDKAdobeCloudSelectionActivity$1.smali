.class Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;
.super Ljava/lang/Object;
.source "BehanceSDKAdobeCloudSelectionActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->onCompletion(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

.field final synthetic val$adobeClouds:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;Ljava/util/ArrayList;)V
    .registers 3
    .param p1, "this$0"    # Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    .prologue
    .line 131
    iput-object p1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;->this$0:Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    iput-object p2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;->val$adobeClouds:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;->this$0:Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;->val$adobeClouds:Ljava/util/ArrayList;

    # invokes: Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setCloudListAdapter(Ljava/util/ArrayList;)V
    invoke-static {v0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->access$000(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;Ljava/util/ArrayList;)V

    .line 135
    return-void
.end method
