.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$1;
.super Ljava/lang/Object;
.source "DragSortListView.java"

# interfaces
.implements Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DragScrollProfile;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpeed(FJ)F
    .registers 5
    .param p1, "w"    # F
    .param p2, "t"    # J

    .prologue
    .line 265
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$1;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mMaxScrollSpeed:F
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v0

    mul-float/2addr v0, p1

    return v0
.end method
