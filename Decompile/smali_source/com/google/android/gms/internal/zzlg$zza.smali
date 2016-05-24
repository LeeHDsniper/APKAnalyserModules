.class final Lcom/google/android/gms/internal/zzlg$zza;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzlg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field mCanRemove:Z

.field mIndex:I

.field final mOffset:I

.field mSize:I

.field final synthetic zzaeH:Lcom/google/android/gms/internal/zzlg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzlg;I)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzlg$zza;->zzaeH:Lcom/google/android/gms/internal/zzlg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mCanRemove:Z

    iput p2, p0, Lcom/google/android/gms/internal/zzlg$zza;->mOffset:I

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzlg;->colGetSize()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mSize:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    iget v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    iget v1, p0, Lcom/google/android/gms/internal/zzlg$zza;->mSize:I

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->zzaeH:Lcom/google/android/gms/internal/zzlg;

    iget v1, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    iget v2, p0, Lcom/google/android/gms/internal/zzlg$zza;->mOffset:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzlg;->colGetEntry(II)Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzlg$zza;->mCanRemove:Z

    return-object v0
.end method

.method public remove()V
    .registers 3

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mCanRemove:Z

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    :cond_a
    iget v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    iget v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mSize:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->mCanRemove:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzlg$zza;->zzaeH:Lcom/google/android/gms/internal/zzlg;

    iget v1, p0, Lcom/google/android/gms/internal/zzlg$zza;->mIndex:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlg;->colRemoveAt(I)V

    return-void
.end method
