.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$3;
.super Ljava/lang/Object;
.source "AdobeUXAssetVideoActivity.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->registerLocalNofications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 7
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 137
    move-object v1, p2

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 139
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    const-string v3, "AdobeNetworkReachabilityStatusKey"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;

    .line 140
    .local v0, "networkStatus":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$4;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode:[I

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;->networkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_28

    .line 147
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->wentOffline()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V

    .line 150
    :goto_21
    return-void

    .line 143
    :pswitch_22
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->wentOnline()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity;)V

    goto :goto_21

    .line 140
    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_22
        :pswitch_22
    .end packed-switch
.end method
