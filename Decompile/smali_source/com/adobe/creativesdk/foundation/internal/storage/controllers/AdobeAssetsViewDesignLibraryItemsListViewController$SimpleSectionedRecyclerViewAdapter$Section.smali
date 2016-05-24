.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Section"
.end annotation


# instance fields
.field firstPosition:I

.field sectionedPosition:I

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;I)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;
    .param p2, "firstPosition"    # I

    .prologue
    .line 368
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 369
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->firstPosition:I

    .line 371
    return-void
.end method
