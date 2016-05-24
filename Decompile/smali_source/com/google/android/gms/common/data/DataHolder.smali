.class public final Lcom/google/android/gms/common/data/DataHolder;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/data/DataHolder$zza;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/common/data/zze;

.field private static final zzabs:Lcom/google/android/gms/common/data/DataHolder$zza;


# instance fields
.field mClosed:Z

.field private final mVersionCode:I

.field private final zzWu:I

.field private final zzabk:[Ljava/lang/String;

.field zzabl:Landroid/os/Bundle;

.field private final zzabm:[Landroid/database/CursorWindow;

.field private final zzabn:Landroid/os/Bundle;

.field zzabo:[I

.field zzabp:I

.field private zzabq:Ljava/lang/Object;

.field private zzabr:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/google/android/gms/common/data/zze;

    invoke-direct {v0}, Lcom/google/android/gms/common/data/zze;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/data/DataHolder;->CREATOR:Lcom/google/android/gms/common/data/zze;

    new-instance v0, Lcom/google/android/gms/common/data/DataHolder$1;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/data/DataHolder$1;-><init>([Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/common/data/DataHolder;->zzabs:Lcom/google/android/gms/common/data/DataHolder$zza;

    return-void
.end method

.method constructor <init>(I[Ljava/lang/String;[Landroid/database/CursorWindow;ILandroid/os/Bundle;)V
    .registers 7
    .param p1, "versionCode"    # I
    .param p2, "columns"    # [Ljava/lang/String;
    .param p3, "windows"    # [Landroid/database/CursorWindow;
    .param p4, "statusCode"    # I
    .param p5, "metadata"    # Landroid/os/Bundle;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->mClosed:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabr:Z

    iput p1, p0, Lcom/google/android/gms/common/data/DataHolder;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabk:[Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    iput p4, p0, Lcom/google/android/gms/common/data/DataHolder;->zzWu:I

    iput-object p5, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabn:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->mClosed:Z

    if-nez v0, :cond_18

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->mClosed:Z

    const/4 v0, 0x0

    :goto_9
    iget-object v1, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    iget-object v1, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/database/CursorWindow;->close()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_18
    monitor-exit p0

    return-void

    :catchall_1a
    move-exception v0

    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method protected finalize()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabr:Z

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    array-length v0, v0

    if-lez v0, :cond_4b

    invoke-virtual {p0}, Lcom/google/android/gms/common/data/DataHolder;->isClosed()Z

    move-result v0

    if-nez v0, :cond_4b

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabq:Ljava/lang/Object;

    if-nez v0, :cond_4f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "internal object: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2a
    const-string v1, "DataBuffer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Internal data leak within a DataBuffer object detected!  Be sure to explicitly call release() on all DataBuffer extending objects when you are done with them. ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/google/android/gms/common/data/DataHolder;->close()V
    :try_end_4b
    .catchall {:try_start_0 .. :try_end_4b} :catchall_56

    :cond_4b
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :cond_4f
    :try_start_4f
    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabq:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_54
    .catchall {:try_start_4f .. :try_end_54} :catchall_56

    move-result-object v0

    goto :goto_2a

    :catchall_56
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getStatusCode()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzWu:I

    return v0
.end method

.method getVersionCode()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/data/DataHolder;->mVersionCode:I

    return v0
.end method

.method public isClosed()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->mClosed:Z

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/common/data/zze;->zza(Lcom/google/android/gms/common/data/DataHolder;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zznP()Landroid/os/Bundle;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabn:Landroid/os/Bundle;

    return-object v0
.end method

.method public zznT()V
    .registers 5

    const/4 v1, 0x0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabl:Landroid/os/Bundle;

    move v0, v1

    :goto_9
    iget-object v2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabk:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1a

    iget-object v2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabl:Landroid/os/Bundle;

    iget-object v3, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabk:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1a
    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    array-length v0, v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabo:[I

    move v0, v1

    :goto_22
    iget-object v2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    array-length v2, v2

    if-ge v1, v2, :cond_43

    iget-object v2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabo:[I

    aput v0, v2, v1

    iget-object v2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/database/CursorWindow;->getStartPosition()I

    move-result v2

    sub-int v2, v0, v2

    iget-object v3, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Landroid/database/CursorWindow;->getNumRows()I

    move-result v3

    sub-int v2, v3, v2

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    :cond_43
    iput v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabp:I

    return-void
.end method

.method zznU()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabk:[Ljava/lang/String;

    return-object v0
.end method

.method zznV()[Landroid/database/CursorWindow;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzabm:[Landroid/database/CursorWindow;

    return-object v0
.end method
