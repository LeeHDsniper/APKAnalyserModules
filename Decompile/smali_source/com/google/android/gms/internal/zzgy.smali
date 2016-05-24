.class public Lcom/google/android/gms/internal/zzgy;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzGo:Lcom/google/android/gms/internal/zzhc;

.field private final zzyL:Lcom/google/android/gms/internal/zzei;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzei;Lcom/google/android/gms/internal/zzhb;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgy;->zzyL:Lcom/google/android/gms/internal/zzei;

    new-instance v0, Lcom/google/android/gms/internal/zzhc;

    invoke-direct {v0, p2}, Lcom/google/android/gms/internal/zzhc;-><init>(Lcom/google/android/gms/internal/zzhb;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgy;->zzGo:Lcom/google/android/gms/internal/zzhc;

    return-void
.end method


# virtual methods
.method public zzfQ()Lcom/google/android/gms/internal/zzei;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgy;->zzyL:Lcom/google/android/gms/internal/zzei;

    return-object v0
.end method

.method public zzfR()Lcom/google/android/gms/internal/zzhc;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgy;->zzGo:Lcom/google/android/gms/internal/zzhc;

    return-object v0
.end method
