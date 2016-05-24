.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;
.super Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
.source "AdobeUXLibraryItemCollectionOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdobeUXLibraryItemCollectionPageChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V
    .registers 2

    .prologue
    .line 73
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$1;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    iput p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updateTitleOfActivity()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V

    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updatePageBackground(Z)V

    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->generateShareIntentInfo()V

    .line 80
    return-void
.end method
