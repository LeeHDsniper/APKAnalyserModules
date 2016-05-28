.class public Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
.super Ljava/lang/Object;
.source "Operations.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/Operations;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private addedCount:I

.field private deletedCount:I

.field private hiddenCount:I

.field private updatedCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 73
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    .line 17
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    .line 18
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    .line 19
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    .line 20
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    .line 46
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    .line 47
    return-void
.end method


# virtual methods
.method public add()V
    .registers 2

    .prologue
    .line 23
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    .line 24
    return-void
.end method

.method public delete()V
    .registers 2

    .prologue
    .line 31
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    .line 32
    return-void
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 27
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    .line 28
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Operations{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .local v0, "builder":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "added:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleted:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hidden:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updated:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public totalCount()I
    .registers 3

    .prologue
    .line 39
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    add-int/2addr v0, v1

    return v0
.end method

.method public update()V
    .registers 2

    .prologue
    .line 35
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    .line 36
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 56
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->addedCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 57
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->deletedCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 58
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->hiddenCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 59
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->updatedCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 60
    return-void
.end method
