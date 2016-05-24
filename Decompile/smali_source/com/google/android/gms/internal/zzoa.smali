.class public final Lcom/google/android/gms/internal/zzoa;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzoh;


# static fields
.field private static final zzaHN:Landroid/net/Uri;


# instance fields
.field private final zzaHO:Landroid/util/LogPrinter;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "uri"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "local"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzoa;->zzaHN:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/LogPrinter;

    const/4 v1, 0x4

    const-string v2, "GA/LogCatTransport"

    invoke-direct {v0, v1, v2}, Landroid/util/LogPrinter;-><init>(ILjava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzoa;->zzaHO:Landroid/util/LogPrinter;

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzob;)V
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzob;->zzxi()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Lcom/google/android/gms/internal/zzoa$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzoa$1;-><init>(Lcom/google/android/gms/internal/zzoa;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1a
    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzod;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1a

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_3b

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3b
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1a

    :cond_3f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzoa;->zzaHO:Landroid/util/LogPrinter;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/LogPrinter;->println(Ljava/lang/String;)V

    return-void
.end method

.method public zzhs()Landroid/net/Uri;
    .registers 2

    sget-object v0, Lcom/google/android/gms/internal/zzoa;->zzaHN:Landroid/net/Uri;

    return-object v0
.end method
