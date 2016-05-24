.class public Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;
.super Ljava/lang/Object;
.source "AdobeNetworkReachability.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AdobeNetworkStatus"
.end annotation


# instance fields
.field public networkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkNotReachable:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;->networkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    return-void
.end method
