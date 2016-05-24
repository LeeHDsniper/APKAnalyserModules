.class public Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;
.super Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;
.source "SpannableGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "SpannableItemEntry"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final colSpan:I

.field private final rowSpan:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 64
    new-instance v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry$1;

    invoke-direct {v0}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry$1;-><init>()V

    sput-object v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 5
    .param p1, "startLane"    # I
    .param p2, "anchorLane"    # I
    .param p3, "colSpan"    # I
    .param p4, "rowSpan"    # I

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;-><init>(II)V

    .line 47
    iput p3, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->colSpan:I

    .line 48
    iput p4, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->rowSpan:I

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;-><init>(Landroid/os/Parcel;)V

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->colSpan:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->rowSpan:I

    .line 55
    return-void
.end method

.method static synthetic access$000(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .prologue
    .line 41
    iget v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->colSpan:I

    return v0
.end method

.method static synthetic access$100(Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;)I
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;

    .prologue
    .line 41
    iget v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->rowSpan:I

    return v0
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 59
    invoke-super {p0, p1, p2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$ItemEntry;->writeToParcel(Landroid/os/Parcel;I)V

    .line 60
    iget v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->colSpan:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 61
    iget v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$SpannableItemEntry;->rowSpan:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 62
    return-void
.end method
