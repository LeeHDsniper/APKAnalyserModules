.class final Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;
.super Ljava/lang/Object;
.source "CdsServiceAbstract.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IntentExtra"
.end annotation


# instance fields
.field private final downloadExtraAssets:Z

.field private final downloadExtraAssetsCount:I

.field private final isLazy:Z

.field private final packType:Ljava/lang/String;

.field private final pluggedOnly:Z

.field private final reason:Ljava/lang/String;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

.field private final wifiOnly:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;Landroid/content/Intent;)V
    .registers 6
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 644
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 645
    const-string v0, "extra-download-extra-assets"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssets:Z

    .line 646
    const-string v0, "extra-max-items"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssetsCount:I

    .line 647
    const-string v0, "extra-lazy-execution"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->isLazy:Z

    .line 648
    const-string v0, "extra-execute-wifi-only"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z

    .line 649
    const-string v0, "extra-execute-plugged-only"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->pluggedOnly:Z

    .line 650
    const-string v0, "extra-pack-type"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;

    .line 651
    const-string v0, "extra-reason"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->reason:Ljava/lang/String;

    .line 652
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .prologue
    .line 629
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .prologue
    .line 629
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->pluggedOnly:Z

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .prologue
    .line 629
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->isLazy:Z

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .prologue
    .line 629
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .prologue
    .line 629
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssets:Z

    return v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .prologue
    .line 629
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssetsCount:I

    return v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 656
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "{downloadExtraAssets: %b, downloadExtraAssetsCount: %d, isLazy: %b, wifiOnly: %b, pluggedOnly: %b, reason: %s}"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssets:Z

    .line 659
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssetsCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->isLazy:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->pluggedOnly:Z

    .line 660
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->reason:Ljava/lang/String;

    aput-object v4, v2, v3

    .line 656
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
