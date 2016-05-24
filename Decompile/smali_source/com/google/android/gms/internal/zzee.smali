.class public final Lcom/google/android/gms/internal/zzee;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzee$zza;
    }
.end annotation


# instance fields
.field public final zzyP:I

.field public final zzyQ:Lcom/google/android/gms/internal/zzdz;

.field public final zzyR:Lcom/google/android/gms/internal/zzei;

.field public final zzyS:Ljava/lang/String;

.field public final zzyT:Lcom/google/android/gms/internal/zzec;


# direct methods
.method public constructor <init>(I)V
    .registers 8

    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzee;-><init>(Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzec;I)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzec;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzee;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzee;->zzyR:Lcom/google/android/gms/internal/zzei;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzee;->zzyS:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzee;->zzyT:Lcom/google/android/gms/internal/zzec;

    iput p5, p0, Lcom/google/android/gms/internal/zzee;->zzyP:I

    return-void
.end method
