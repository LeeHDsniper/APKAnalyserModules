.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController$InstanceState;
.source "AdobeAssetsViewRecyclerListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "RecyclerViewInstanceState"
.end annotation


# instance fields
.field public _layoutManagerState:Landroid/os/Parcelable;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController$InstanceState;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;)V

    return-void
.end method
