.class final Lcom/google/android/gms/common/internal/zze$4;
.super Lcom/google/android/gms/common/internal/zze;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/internal/zze;->zza(CC)Lcom/google/android/gms/common/internal/zze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic zzacY:C

.field final synthetic zzacZ:C


# direct methods
.method constructor <init>(CC)V
    .registers 3

    iput-char p1, p0, Lcom/google/android/gms/common/internal/zze$4;->zzacY:C

    iput-char p2, p0, Lcom/google/android/gms/common/internal/zze$4;->zzacZ:C

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/zze;-><init>()V

    return-void
.end method


# virtual methods
.method public zzd(C)Z
    .registers 3

    iget-char v0, p0, Lcom/google/android/gms/common/internal/zze$4;->zzacY:C

    if-gt v0, p1, :cond_a

    iget-char v0, p0, Lcom/google/android/gms/common/internal/zze$4;->zzacZ:C

    if-gt p1, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
