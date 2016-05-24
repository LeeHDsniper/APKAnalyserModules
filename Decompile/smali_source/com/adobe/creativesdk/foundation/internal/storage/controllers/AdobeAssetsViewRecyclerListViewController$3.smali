.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$3;
.super Ljava/lang/Object;
.source "AdobeAssetsViewRecyclerListViewController.java"

# interfaces
.implements Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->performInitialization(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)V
    .registers 7
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    invoke-virtual {v0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->handleItemClick(Landroid/view/View;I)V

    .line 198
    return-void
.end method
