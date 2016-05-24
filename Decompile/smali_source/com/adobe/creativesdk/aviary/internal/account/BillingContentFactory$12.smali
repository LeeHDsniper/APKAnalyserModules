.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPurchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$trackerName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 348
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->val$identifier:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->val$trackerName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Long;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/Long;

    .prologue
    .line 351
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$300(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->val$identifier:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->val$trackerName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->trackBeginPurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 348
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;->call(Ljava/lang/Long;)V

    return-void
.end method
